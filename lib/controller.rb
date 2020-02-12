class Goodreads::Controller

    attr_accessor :current_book 

    def run 
        create_books 
        welcome  
        get_input
    end 

    def create_books 
        book_array = Goodreads::Scraper.scrape_fiction_giveaway
        Goodreads::Book.create_from_site(book_array)
    end 

    def welcome
        puts "Welcome to the Goodreads Fiction Giveaways App!"
        puts "Discover all current fiction giveaways on Goodreads."
    end 

    def instructions 
        puts ""
        puts "----------"
        puts "Type list for the full list of giveaways."
        puts "Type the book number (1-30) to learn more details about a specific book giveaway."
        puts "Type quit any time you want to quit the program."
        puts "----------"
        puts ""
    end 

    def get_input
        instructions 
        input = nil 
        while input != "quit"
        input = gets.strip 
            if input.downcase == "list"
                list_giveaways 
                instructions 
            elsif input.to_i <= Goodreads::Book.all.length && input.to_i > 0
                self.current_book = Goodreads::Book.all[input.to_i-1]
                puts "You selected the giveaway for #{current_book.title}:"
                puts "Author: #{current_book.author}."
                puts "#{current_book.release_date}."
                puts "Giveaway Details: #{current_book.giveaway_details}."
                instructions
            elsif input.downcase == "quit"
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

    def error_message
        puts "Sorry, I don't know what you're looking for! Please try again!"
        instructions 
    end 

    def quit_app
        puts "You have quit the program. Goodbye!"  
        exit
    end 

end 