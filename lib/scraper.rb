require 'pry'
require 'nokogiri'
require 'open-uri'

class Scraper

    def self.scrape_page_categories
        doc = Nokogiri::HTML(open("https://www.goodreads.com/choiceawards/best-books-2019"))
        categories = []
        # binding.pry 
        details = doc.css("div.clearFix")
        binding.pry 
        details.each do |category|
            category_hash = {
                :name => category.css("a h4.category__copy").text,
                :url => category.css("a").attribute("href").value,
                :winner_image => category.css("div.category__winnerImageContainer img").attribute("src").value 
            }
        end 

        category_hash

    end 

    self.scrape_page_categories 

end 