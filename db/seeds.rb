# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Book.create!(
  title: 'Xamarin Essentials',
  description: 'Learn how to efficiently develop Android and iOS apps for deployment using the Xamarin platform',
  url: 'https://www.packtpub.com/ebook_download/17672/',
  image: 'https://dz13w8afd47il.cloudfront.net/sites/default/files/imagecache/ppv4_main_book_cover/0838OT_Xamarin%20Essentials.jpg')

Book.create!(
  title: 'ElasticSearch Cookbook',
  description: 'As a user of ElasticSearch in your web applications you’ll already know what a powerful technology it is, and with this book you can take it to new heights with a whole range of enhanced solutions from plugins to scripting.',
  url: 'https://www.packtpub.com/ebook_download/15749/',
  image: 'https://d255esdrn735hr.cloudfront.net/sites/default/files/imagecache/ppv4_main_book_cover/6627OS.jpg')

Book.create!(
  title: 'Redis Applied Design Patterns',
  description: 'Use Redis\' features to enhance your software development through a wide range of practical design patterns',
  url: 'https://www.packtpub.com/ebook_download/18103/',
  image: 'https://d1ldz4te4covpm.cloudfront.net/sites/default/files/imagecache/ppv4_main_book_cover/6713OS_Redis%20Applied%20Design%20Patterns_Cover.jpg')

Book.create!(
  title: 'Continuous Delivery and DevOps: A Quickstart guide',
  description: 'Streamline and optimize your workflow with this fast and engaging guide to continuous delivery and DevOps. Delivering quality software every time will become a way of life.',
  url: 'https://www.packtpub.com/ebook_download/10763/',
  image: 'https://d1ldz4te4covpm.cloudfront.net/sites/default/files/imagecache/ppv4_main_book_cover/3684EXP_DevOps%20in%20a%20Flash_0.jpg')
