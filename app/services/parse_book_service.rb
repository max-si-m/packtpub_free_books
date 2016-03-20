class ParseBookService < Aldous::Service
  BASE_URL = 'https://www.packtpub.com'
  FREE_BOOKS_PAGE = "#{BASE_URL}/packt/offers/free-learning"

  def perform
    headless = Headless.new
    headless.start

    @driver = Selenium::WebDriver.for :firefox
    @driver.manage.window.resize_to(1920, 1080) # site have responsive design

    @driver.get FREE_BOOKS_PAGE
    login if loged_out?

    prepare_book
    claim_new_book
    finish_book

    headless.destroy

    CreateBookService.perform(@book)
  end

  private

  def login
    click_on text: 'Log in'
    form = wait.until do
      element = @driver.find_element(:xpath, "//form[@id='packt-user-login-form']")
      element if element.displayed?
    end

    fill_in "email", form, with: ENV['PACKTUB_EMAIL']
    fill_in "password", form, with: ENV['PACKTUB_PASSWORD']
    click_on form, element: 'input', contains: '@value', text: 'Login'

    Result::Failure.new message: 'Login failed' if invalid_data?
  end

  def prepare_book
    @book = Book.new
    title = @driver.find_element(:css, '.dotd-title')
    @book.title = title.text.strip
    @book.description = title.find_element(:xpath, './/following-sibling::div').text

    img_path = '.dotd-main-book-image > a > img'
    image = @driver.find_element(:css, img_path)["data-original"]
    @book.image = image[/^http/] ? image : "http:#{image}"
  end

  def finish_book
    click_on element: 'div', contains: '@title', text: @book.title
    path = "//a[contains(@href,'ebook_download')]"
    url = @driver.find_element(:xpath, path)[:href]
    @book.url = url.gsub(/(pdf|mobi|epub)$/, '')
  end

  def click_on(parent = @driver, element: 'a', contains: '.', text: )
    path = ".//#{element}[contains(#{contains},'#{text}')]"
    parent.find_element(:xpath, path).click
  end

  def fill_in(name, form, with:)
    path = ".//input[contains(@name,'#{name}')]"
    form.find_element(:xpath, path).send_keys(with)
  end

  def loged_out?
    @driver.find_element(:xpath, "//a[contains(.,'Sign out')]")
  rescue Selenium::WebDriver::Error::NoSuchElementError
    false
  end

  def wait
    @wait ||= Selenium::WebDriver::Wait.new(:timeout => 30)
  end

  def claim_new_book
   click_on element: 'input', contains: '@value', text: 'Claim Your Free eBook'
  end

  def invalid_data?
    @driver.page_source[/invalid email address and password/]
  end
end
