# README

Gatherer for [packtpub](https://www.packtpub.com/packt/offers/free-learning) free books

Usage:

1. Add variable to environment `PACKTUB_EMAIL` and `PACKTUB_PASSWORD`
2. Install `firefox`
3.  Use rake task for adding last free book:
 
  ```
  bundle exec rake parsers:add_new_book
  ```
