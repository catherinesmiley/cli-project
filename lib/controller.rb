class Goodreads::Controller

    def run 
        welcome 
        list_giveaways
        choose_book
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
            puts "Enter the number of the book you're interested in. Type list to see the full list again. Type quit to quit the program."
            input = gets.strip 
            case input
            when "1"
                puts "Discover book 1"
            when "2"
                puts "Discover book 2"
            when "3"
                puts "Discover book 3"
            when "list"
                list_giveaways
            else 
                # replace with error
                puts "That is no one. Try again."
            end 
        end 
    end 

    def quit 
        puts "You have quit the program. Goodbye!"
    end 

end 