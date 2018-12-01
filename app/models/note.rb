class Note < ActiveRecord::Base
  has_many :viewers
  has_many :readers, :through => :viewers, :source => :user
  belongs_to :user

  def self.create_from_params(note_params)
    note = Note.create(note_params)
    note.readers << note.user
  end

  def update_from_params(note_params)
    self.update(note_params)
    self.readers << self.user
  end

  def visible_to=(reader_list)
    self.readers = reader_list.split(',').collect do |reader_name|
      User.find_by(name: reader_name.strip)
    end
  end

  def visible_to
    self.readers.collect do |reader|
      reader.name
    end.join(", ")
  end
end
