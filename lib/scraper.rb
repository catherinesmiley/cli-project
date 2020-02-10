require 'pry'
require 'open-uri'
require 'nokogiri'

class Goodreads::Scraper

    def self.scrape_fiction_giveaway
        doc = Nokogiri::HTML(open("https://www.goodreads.com/giveaway/genre/Fiction"))
        books = []
        details = doc.css("ul.list li.listElement.giveawayListItem div.giveawayPreviewBookContainer div.description.descriptionContainer")
        details.each do |book|
            book_hash = {
                :title => book.css("a.bookTitle").text,
                :author => book.css("div.authorName__container a span").text,
                :release_date => book.css("div.greyText.releaseDate").text,
                :giveaway_details => book.css("div.giveawayDescriptionDetails span").text
            }
            books << book_hash
        end
        books
    end 

end 