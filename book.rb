# Remember to run "source("book.rb")" in irb

class Book

  @@on_shelf = []
  @@on_loan = []

  attr_accessor :due_date, :date_borrowed
  attr_reader :title, :author, :isbn


# INSTANCE METHODS

  def initialize(title, author, isbn, date_borrowed = nil)
    @title = title
    @author = author
    @isbn = isbn
    @date_borrowed = date_borrowed
  end

  def borrow # complete
      if self.lent_out?
        "This book is currently lent out."
      else
        @@on_loan.push(@@on_shelf.delete(self))
        @@on_loan.map{|x| x.title == self.title ? x.date_borrowed = Time.now : x}
        puts @@on_loan
      end
  end

  def return_to_library # complete
    @@on_shelf.push(@@on_loan.delete(self))
  end

  def lent_out? # complete
    @@on_loan.include?(self)
  end

# CLASS METHODS

  def self.create(title, author, isbn)
    book = Book.new(title, author, isbn)
    @@on_shelf.push(book)
    return book
  end

  def self.available # complete
    puts "The following books are available for borrowing: "
    @@on_shelf.each do |book|
      puts "- #{book.title} by #{book.author}"
      end
  end
  # want to display all books without the

  def self.borrowed # complete
    puts "The following books are NOT available for borrowing: "
    @@on_loan.each do |book|
      puts "- #{book.title} by #{book.author}"
    end
  end

  def current_due_date # complete
    self.date_borrowed + (60*60*24*14)
  end

  def self.overdue_books
    #.each for book on loan
    # check if date_borrowed > Time.now
    # if True then overdue
    @@on_loan.each do |book|
      if book.current_due_date >= Time.now
      else
        puts "- #{book.title} + #{book.author} is overdue"
      end
    end
  end

  def self.browse
    @@on_shelf.sample
  end

  def self.test
    @@on_shelf.inspect
  end


end


# BOOKS

harry_potter = Book.create("Harry Potter and the Philosopher Stone", "J.K.Rowling", "123949501",)
seven_habits = Book.create("7 Habits of Highly Effective People", "Steph R. Covey", "204951840",)
lotr = Book.create("Lord of the Rings", "J.R.R Tolkien", "209584729")
got = Book.create("Game of Thrones", "George R. R. Martin", "129475691284")
