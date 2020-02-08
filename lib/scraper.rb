require 'pry'
require 'open-uri'
require 'nokogiri'

# class Goodreads::Scraper
class Scraper 

    # def self.scrape_page_categories
    #     doc = Nokogiri::HTML(open("https://www.goodreads.com/choiceawards/best-books-2019"))
    #     categories = []
    #     details = doc.css("div.clearFix div.categoryContainer div.category.clearFix")
    #     details.each do |category|
    #         category_hash = {
    #             :category_name => category.css("a h4.category__copy").text,
    #             :url => category.css("a").attribute("href").value,
    #             :winner_image => category.css("div.category__winnerImageContainer img").attribute("src").value 
    #         }
    #         binding.pry 
    #         categories << category_hash 
    #     end 
    #     categories
    # end 

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

    self.scrape_fiction_giveaway

end 