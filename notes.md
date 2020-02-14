# greeting 
# list all giveaways by number - number and book title
# select giveaway - type book number
# if not valid number - error
# once book is selected, get more info - type author, release date, or giveaway details
# if typo or other word - error

    # def find_book_by_number
    #     input = gets.strip 
    #         if input == "1"
    #             puts "1. Author name, release date, and details"
    #         if input == "2"
    #             puts "2. Author name, release date, and details"
    #         if input == "3"
    #             puts "3. Author name, release date, and details"
    #         elsif input == "quit"
    #             quit_app
    #         else 
    #             error_message
    #         end
    #     end 
    # end 

    def user_interaction
        instructions 
        input = gets.strip 
        if input == "list"
            list_giveaways 
            find_book_by_number 
            instructions    
        # elsif input.to_i.between?(1,30)
        #     input = self.current_book
        #     find_book_by_number 
        #     self.current_book 
        elsif input == "quit"
            quit_app
        else 
            error_message
        end 
    end 
# separate check input method
# add instructions after list is shown
# add help option to display menu again

for best fiction of 2019:

class Goodreads::Book 

    attr_accessor :title, :author, :votes 

    @@all = [] 

    def initialize(book_hash)
        book_hash.each do |key, value|
            self.send "#{key}=", value
        end 
        @@all << self 
    end 

    def self.create_from_site(book_array)
        book_array.each do |book|
            self.new(book)
        end 
    end 

    def self.all 
        @@all 
    end 

end 

class Goodreads::Controller

    attr_accessor :current_book 

    def run 
        create_books 
        welcome  
        get_input
    end 

    def create_books 
        book_array = Goodreads::Scraper.scrape_best_fiction 
        Goodreads::Book.create_from_site(book_array)
    end 

    def welcome
        puts "Welcome to the Goodreads Best Fiction Books of 2019 App!"
        puts "Discover the winner, and all nominees, of fiction books released in 2019 according to Goodreads voters."
    end 

    def instructions 
        puts ""
        puts "----------"
        puts "Type list for the full list of nominees."
        puts "Type the book number to learn more details about a secific book"
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
                list_books 
                instructions
                find_book_by_number  
            elsif input.downcase == "quit"
                quit_app
            else 
                error_message
            end 
        end 
    end 

    def list_books
        puts "Here's the full list by book title:"
        Goodreads::Book.all.each.with_index(1) {|book, index| puts "#{index}. #{book.title}"}
    end

    def find_book_by_number
        input = nil 
        while input != "quit"
        input = gets.strip 
            if input.to_i <= Goodreads::Book.all.length && input.to_i > 0
                current_book = Goodreads::Book.all[input.to_i-1]
                puts "You selected the giveaway for #{current_book.title}:"
                puts "Author: #{current_book.author}."
                puts "Votes: #{current_book.votes}."
                instructions
                # check_input
            elsif input.downcase == "quit"
                quit_app
            elsif input.downcase == "list"
                list_books
                instructions 
                find_book_by_number
            else 
                error_message 
            end 
        end 
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


    # def find_book_by_number
    #     input = nil 
    #     while input != "quit"
    #     input = gets.strip 
    #         if input.to_i <= Goodreads::Book.all.length && input.to_i > 0
    #             self.current_book = Goodreads::Book.all[input.to_i-1]
    #             puts "You selected the giveaway for #{current_book.title}:"
    #             puts "Author: #{current_book.author}."
    #             puts "#{current_book.release_date}."
    #             puts "Giveaway Details: #{current_book.giveaway_details}."
    #             instructions
    #             # check_input
    #         elsif input.downcase == "quit"
    #             quit_app
    #         elsif input.downcase == "list"
    #             list_giveaways
    #             instructions 
    #             find_book_by_number
    #         else 
    #             error_message 
    #         end 
    #     end 
    # end 

    don't need a while loop
    allows me to call other methods
    alternative - call get_input method again from inside get_input method
    wouldn't even need to call instructions again
    while loops can be a little bit riskier - possible to get stuck in infinite loops
    
