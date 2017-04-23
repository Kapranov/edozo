class Letter
  extend ActiveModel::Naming
  attr_reader :char

  def initialize(char)
    @char = char
  end

  def self.all
    ('A'..'Z').map { |c| new(c) }
  end

  def self.find(param)
    all.detect { |l| l.char == param }
  end

  # This method is not required because we are not using letter resource
  # def to_param
  #   @char.downcase
  # end

  def products
    Product.where("name LIKE ?", @char + '%').order("name")
  end

  def to_model
    # You will get to_model error, if you don't have this dummy method
  end

  # You need this otherwise you get an error
  def persisted?
    false
  end
end
