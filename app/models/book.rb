class Book < ActiveRecord::Base
  extend FriendlyId
  friendly_id :slug_candidates, use: [:slugged, :finders]

  validates :title, :url, presence: true, uniqueness: true
  validates :slug, uniqueness: true

  def self.search(title)
    where('title ILIKE :title OR description ILIKE :title', title: "%#{title}%")
  end

  private
    def uid
      SecureRandom.hex 2
    end

    def slug_candidates
      [
        :title,
        [:uid, :title]
      ]
    end

    def should_generate_new_friendly_id?
      title_changed? || slug.blank?
    end
end
