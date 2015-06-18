class Rolodex
  attr_reader :contacts

  def initialize
    @contacts = []
    @id = 1000
  end

  def add_contact(contact)
    contact.id = @id
    @contacts << contact
    @id += 1
  end

  def find_contact(contact_id)
    contact_id = contact_id.to_i
    @contacts.find { |contact| contact.id == contact_id }
  end
end

