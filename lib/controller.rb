class Goodreads::Controller

    def run 
        welcome 
        list_categories 
        index
        winner 
        nominees
        quit 
    end 

    def welcome
        puts "Welcome to the Goodreads Best Books 2019 CLI App!"
    end 

    def list_categories
        puts "Discover the winner and nominees for each category."
        puts "Here are the categories:"
        puts <<-DOC
            1. Fiction
            2. Mystery & Thriller
            3. Historical Fiction
        DOC
    end

    def index
        input = nil
        while input != "quit"
            puts "Enter the number of the category you're interested in. Type list to see the categories again. Type quit to quit the program."
            input = gets.strip 
            case input
            when "1"
                puts "Discover category 1"
            when "2"
                puts "Discover category 2"
            when "3"
                puts "Discover category 3"
            when "list"
                list_categories 
            else 
                # replace with error
                puts "That is no one. Try again."
            end 
        end 
    end 

    def winner 
    end 

    def nominees
    end 

    def quit 
        puts "You have quit the program. Goodbye!"
    end 

end 