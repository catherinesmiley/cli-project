class Goodreads::Controller
# class Controller 

    attr_accessor :current_book 

    def run 
        create_books 
        welcome  
        instructions 
        user_interaction
        quit 
    end 

    def create_books 
        book_array = Scraper.scrape_fiction_giveaway
        Book.create_from_site(book_array)
    end 

    def welcome
        puts "Welcome to the Goodreads Fiction Giveaways App!"
    end 

    def instructions 
        puts "Discover all current fiction giveaways on Goodreads."
        puts "Type list for the full list of giveaways."
        puts "Type the book number (1-30) to select a book giveaway."
        puts "----------------------"
        puts "After you've selected a book number:"
        puts "Type author for the author's name."
        puts "Type release date for the book's release date."
        puts "Type details for the giveeaway details and book summary."
        puts "Type quit any time you want to quit the program."
    end 

    def user_interaction
        input = nil 
        while input != "quit" 
            input = gets.strip 
            if input == "list"
                list_giveaways 
            elsif input.to_i.between?(1,30)
                input = current_book
                find_book_by_number 
                more_instructions 
            elsif input == "author"
                puts "Author name"
            elsif input == "release date"
                puts "Release Date"
            elsif input == "details"
                puts "Giveaway details and book summary"
            elsif input == "quit"
                quit 
            else 
                error_message
            end 
        end 
    end 

    def list_giveaways
        puts "Here's the full list by book title:"
        puts <<-DOC
            1. The Orphan Collector
            2. Above the Bay of Angels
            3. Good Citizens Need Not Fear: Stories
        DOC
    end

    def find_book_by_number
        input = nil 
        while input != "quit"
            input = gets.strip 
        end 

    end 

    def more_instructions
    end 

    def error_message
        puts "Sorry, I don't know what you're looking for! Please try again!"
        user_interaction 
    end 

    def quit 
        puts "You have quit the program. Goodbye!"  
        quit 
    end 

end 