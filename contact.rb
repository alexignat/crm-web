class Contact
  attr_accessor :first_name, :last_name, :email, :note
  attr_reader :id

  # @@id = 1 This assingment has id stored in the rolodex

  def initialize(first_name, last_name, email, note)
    @id = @@id
    # @@id += 1 This assingment has id stored in the rolodex
    @first_name = first_name.capitalize
    @last_name = last_name.capitalize
    @email = email
    @note = note
  end
end