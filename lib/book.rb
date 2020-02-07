class Goodreads::Book

    attr_accessor :category_name, :url, :winner_image, :title, :author, :description, :votes

    @@all = [] 

    def self.all 
        @@all 
    end 

end 