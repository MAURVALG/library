class Person < ApplicationRecord

#belong_to:Author
has_many :person_books
has_many :books, through: :person_books

  validates :email, :doc_type, :doc, presence: true
  validates :email, confirmation: true
  validates :email_confirmation, presence: true
  validates :doc_type, exclusion: {
    in: ["TI"], message: "%{value} is invalid"
  }
  validates :doc_type, format: {
    with: /\A[A-Z][A-Z]\z/, message: "Paila mi perro"
  }
  validates :doc_type, inclusion: {
    in: %w(CC CE)
  }
  validates :doc, length: { minimum: 6, maximum: 12}
  # length: { in: 6..12}
  # length: { is: 12}

end
