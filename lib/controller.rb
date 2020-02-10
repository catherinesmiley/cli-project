class Goodreads::Controller

    attr_accessor :current_book 

    def run 
        create_books 
        welcome  
        instructions 
        user_interaction
        quit 
    end 

    def create_books 
        binding.pry 
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
        input = gets.strip 
            if input == "list"
                list_giveaways 
            elsif input.to_i.between?(1,30)
                input = self.current_book
                find_book_by_number 
                self.current_book 
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
        input = gets.strip 
            if input == "1"
                puts "1. Author name, release date, and details"
            if input == "2"
                puts "2. Author name, release date, and details"
            if input == "3"
                puts "3. Author name, release date, and details"
            elsif input == "quit"
                quit
            else 
                error_message
            end
        end 
    end 

    def error_message
        puts "Sorry, I don't know what you're looking for! Please try again!"
        instructions 
    end 

    def quit 
        puts "You have quit the program. Goodbye!"  
        exit
    end 

end 