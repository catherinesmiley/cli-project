require_relative "./goodreads/version"
require 'pry'
require 'open-uri'
require 'nokogiri'

require_relative './book'
require_relative './controller'
require_relative './scraper'


module Goodreads
  class Error < StandardError; end
  # Your code goes here...
end
