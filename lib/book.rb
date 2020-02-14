class Goodreads::Book 

    attr_accessor :title, :author, :release_date, :giveaway_details

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