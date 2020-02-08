class Goodreads::Book

    attr_accessor :title, :author, :release_date, :giveaway_details

    @@all = [] 

    def initialize
        @@all << self 
    end 

    def self.all 
        @@all 
    end 

end 