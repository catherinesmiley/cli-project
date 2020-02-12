# require 'pry'
# require 'open-uri'
# require 'nokogiri'

class Goodreads::Scraper
# class Scraper

    def self.scrape_fiction_giveaway
        doc = Nokogiri::HTML(open("https://www.goodreads.com/giveaway/genre/Fiction"))
        books = []
        details = doc.css("ul.list li.listElement.giveawayListItem div.giveawayPreviewBookContainer div.description.descriptionContainer")
        details.each do |book|
            book_hash = {
                :title => book.css("a.bookTitle").text,
                :author => book.css("div.authorName__container a span").text,
                :release_date => book.css("div.greyText.releaseDate").text.strip,
                :giveaway_details => book.css("div.giveawayDescriptionDetails span").text.strip
            }
            books << book_hash
        end
        books
    end 

#     def self.scrape_best_fiction
#         doc = Nokogiri::HTML(open("https://www.goodreads.com/choiceawards/best-fiction-books-2019"))
#         books = []
#         details = doc.css("div.gcaRightContainer div.gcaBody.js-lazyGlideContainer.js-dataTooltip div.poll div.pollContents")
#         details.each do |book|
#             book_hash = {
#                 # :title => book.css("div.answerWrapper div.js-tooltipTrigger.tooltipTrigger a img").attribute("alt").text.split(/ by/i, 2)[0],
#                 :title => book.css("div.inlineblock.pollAnswer.resultShown div.answerWrapper div.js-tooltipTrigger.tooltipTrigger a img").attribute("alt").text.split(/ by/i, 2)[0],
#                 :author => book.css("div.inlineblock.pollAnswer.resultShown div.answerWrapper div.js-tooltipTrigger.tooltipTrigger a img").attribute("alt").text.split(/ by/i, 2)[-1].strip,
#                 :votes => book.css("div.inlineblock.pollAnswer.resultShown strong.uitext.result").text.strip
#             }
#             books << book_hash
#         end
#         books
#     end 

# self.scrape_best_fiction

end 