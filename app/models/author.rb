class Author < ApplicationRecord


before_validation :print_example_before_validation
before_validation :setup_name_if_email_exists
after_validation :print_example_afeter_validation
validates :email, :name, presence: true
has_many :books, counter_cache: :books_count



  private

  def setup_name_if_email_exists
  domanin_name = self.amail.scan(/[a-zA-Z]+@./).flatten.first
  self.name = domanin_name.any? ? domanin_name.blank?
  end

  # def print_example_before_validation
  puts "Before Validation Callback "
  end

  def print_example_after_validation
    puts "Before Validation Callback "
  end

end
