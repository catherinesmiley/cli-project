
[1mFrom:[0m /home/cesmiley/flatiron/projects/cli-project/goodreads/lib/scraper.rb @ line 13 Scraper.scrape_page_categories:

     [1;34m7[0m: [32mdef[0m [1;36mself[0m.[1;34mscrape_page_categories[0m
     [1;34m8[0m:     doc = [1;34;4mNokogiri[0m::HTML(open([31m[1;31m"[0m[31mhttps://www.goodreads.com/choiceawards/best-books-2019[1;31m"[0m[31m[0m))
     [1;34m9[0m:     categories = []
    [1;34m10[0m:     details = doc.css([31m[1;31m"[0m[31mdiv.clearFix[1;31m"[0m[31m[0m)
    [1;34m11[0m:     details.each [32mdo[0m |category|
    [1;34m12[0m:         categories << category.name = category.css([31m[1;31m"[0m[31ma h4.category__copy[1;31m"[0m[31m[0m).text
 => [1;34m13[0m:         binding.pry 
    [1;34m14[0m: 
    [1;34m15[0m:     [1;34m# category names: category.css("a h4.category__copy").text[0m
    [1;34m16[0m:     [32mend[0m 
    [1;34m17[0m: 
    [1;34m18[0m:     categories
    [1;34m19[0m: 
    [1;34m20[0m: [32mend[0m 
