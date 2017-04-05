class Book

  @@on_shelf = []
  @@on_loan = []

  attr_accessor :due_date

  def initialize (name)
    @name = name
  end

  def borrow

  end

  def return_to_library

  end

  def lent_out?

  end

  def self.create
    new = Book.new
    @@onshelf << new
    return
  end
end
