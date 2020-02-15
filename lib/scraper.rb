class Goodreads::Scraper

    def self.scrape_fiction_giveaway
        doc = Nokogiri::HTML(open("https://www.goodreads.com/giveaway/genre/Fiction?name=Fiction&sort=recently_listed&tab=recently_listed"))
        details = doc.css("ul.list li.listElement.giveawayListItem div.giveawayPreviewBookContainer div.description.descriptionContainer")
        details.map do |book|
            {
                :title => book.css("a.bookTitle").text,
                :author => book.css("div.authorName__container a span").text.strip,
                :release_date => book.css("div.greyText.releaseDate").text.split(": ")[-1],
                :giveaway_details => book.css("div.giveawayDescriptionDetails span").text.strip
            }
        end
    end 

end 

