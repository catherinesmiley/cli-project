class Goodreads::Controller

    def run 
        welcome 
        list_giveaways
        choose_book
        # get_book_details
        quit 
    end 

    def welcome
        puts "Welcome to the Goodreads Fiction Giveaways App!"
    end 

    def list_giveaways
        puts "Discover all current fiction giveaways on Goodreads."
        puts "Here's the full list by book title:"
        puts <<-DOC
            1. The Orphan Collector
            2. Above the Bay of Angels
            3. Good Citizens Need Not Fear: Stories
        DOC
    end

    def choose_book
        input = nil
        while input != "quit"
            puts "Enter the number of the giveaway for more details. Type list to see the full giveaway list again. Type quit to quit the program."
            input = gets.strip 
            case input
            when "1"
                puts "The Orphan Collector: type author for this book's author, type release date for this book's release date, or type details for this book's giveaway details and summary."
            when "2"
                puts "Above the Bay of Angels: type author for this book's author, type release date for this book's release date, or type details for this book's giveaway details and summary."
            when "3"
                puts "Good Citizens Need Not Fear: Stories: type author for this book's author, type release date for this book's release date, or type details for this book's giveaway details and summary."
            when "list"
                list_giveaways
            else 
                # replace with error
                puts "Sorry, I don't know what you're looking for! Please try again!"
            end 
        end 
    end 

    # def get_book_details
    #     input = nil
    #     while input != "quit"
    #         puts "Enter the number of the giveaway for more details. Type list to see the full giveaway list again. Type quit to quit the program."
    #         input = gets.strip 
    #         case input
    #         when "author"
    #             puts "Author name"
    #         when "2"
    #             puts "release date"
    #         when "3"
    #             puts "details"
    #         when "list"
    #             list_giveaways
    #         else 
    #             # replace with error
    #             puts "Sorry, I don't know what you're looking for! Please try again!"
    #         end 
    #     end 
    # end 

    def quit 
        puts "You have quit the program. Goodbye!"
    end 

end 