class Goodreads::Controller

    attr_accessor :current_book 

    def run 
        create_books 
        welcome  
        # instructions 
        user_interaction
    end 

    def create_books 
        book_array = Goodreads::Scraper.scrape_fiction_giveaway
        Goodreads::Book.create_from_site(book_array)
    end 

    def welcome
        puts "Welcome to the Goodreads Fiction Giveaways App!"
    end 

    def instructions 
        puts "Discover all current fiction giveaways on Goodreads."
        puts "Type list for the full list of giveaways."
        puts "Type the book number (1-30) to learn more details about a specific book giveaway."
        puts "Type quit any time you want to quit the program."
    end 

    def user_interaction
        instructions 
        input = nil 
        while input != "quit"
        input = gets.strip 
            if input == "list"
                list_giveaways 
                find_book_by_number 
                instructions    
            elsif input == "quit"
                quit_app
            else 
                error_message
            end 
        end 
    end 

    def list_giveaways
        puts "Here's the full list by book title:"
        Goodreads::Book.all.each.with_index(1) {|book, index| puts "#{index}. #{book.title}"}
    end

    def find_book_by_number
        input = nil 
        while input != "quit"
        input = gets.strip 
            if input.to_i <= Goodreads::Book.all.length 
                current_book = Goodreads::Book.all[input.to_i-1]
                puts "You selected the giveaway for #{current_book.title}:"
                puts "Author: #{current_book.author}."
                puts "#{current_book.release_date}."
                puts "Giveaway Details: #{current_book.giveaway_details}."
            elsif input == "quit"
                quit_app
            else 
                error_message 
            end 
        end 
    end 

    def more_details 
        puts "Author, Release Date, Giveaway Details"
    end 

    def error_message
        puts "Sorry, I don't know what you're looking for! Please try again!"
        instructions 
    end 

    def quit_app
        puts "You have quit the program. Goodbye!"  
        exit
    end 

end 