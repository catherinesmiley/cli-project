require 'pry'
require 'open-uri'
require 'nokogiri'

# class Goodreads::Scraper
class Scraper 

    def self.scrape_page_categories
        doc = Nokogiri::HTML(open("https://www.goodreads.com/choiceawards/best-books-2019"))
        categories = []
        details = doc.css("div.clearFix div.categoryContainer div.category.clearFix")
        details.each do |category|
            category_hash = {
                :category_name => category.css("a h4.category__copy").text,
                :url => category.css("a").attribute("href").value,
                :winner_image => category.css("div.category__winnerImageContainer img").attribute("src").value 
            }
            binding.pry 
            categories << category_hash 
        end 

        categories

    end 

    self.scrape_page_categories

    def self.scrape_each_category
        doc = Nokogiri::HTML(open(""))
        category_nominees = {}

    end 


end 