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

    separate check input method