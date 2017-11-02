class Book < ApplicationRecord

  belongs_to :author
  has_many :person_books
  has_many :people, through: :person_books

  # validaytions link http://guides.rubyonrails.org/active_record_validations.html
  validates :terms_of_service, acceptance: true
  validates :number_of_pages,
            numericality: {
              greater_than: 9 , less_than: 2001, message: "Invalid value."
            }
  validates :title, uniqueness: { case_sensitive: true }

  validates :desc, length: {minimum: 25}

  validate :authorized_author

  def authorized_author
    if !self.author or (self.author and !self.author.authorized)
      self.errors.add(:author, "You need to complete the administrative process before you can create a book")
    end
  end
  # validates :title, uniqueness: { case_sensitive: true }, if: lambda { self.number_of_pages < 2000 }
  # validates :title, uniqueness: { case_sensitive: true }, if: Proc.new { |c| c.number_of_pages < 2000 }
  # validates :title, uniqueness: { case_sensitive: true }, if: :number_of_pages_less_than_2000?, if: :desc_length_greater_than_500?
  #
  # def desc_length_greater_than_500?
  #   self.desc.length > 500
  # end
  #
  # def number_of_pages_less_than_2000?
  #   self.number_of_pages < 2000
  # end
  #
  #
  #

  # validates :title,absence: true, on: :create
  # validates :title,absence: true, on: :update
  # validates_each :title, :desc do |record, attr, value|
  #   record.errors.add(attr, "No es valido por que aja") if value.length > 1000 and value.scan(/[a-z]/)
  # end
  # validates_with DescValidator, fields: [:desc]
  # class DescValidator < ActiveModel::Validator
  #
  #   def validate(record)
  # =>  if (... somthing)
  #       record.errors[:desc] << "Tienes un error... por que ... bla bla"
  #     end
  #   end
  #
  # end

  # numericality: {
  #   greater_than: 9,
  #   greater_than_or_equal_to: 10,
  #   equal_to: 10,
  #   less_than: 2000,
  #   less_than_or_equal_to: 1999,
  #   other_than: 500,
  #   odd: true,
  #   even: true,
  # }

end
