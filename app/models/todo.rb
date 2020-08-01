class Todo < ApplicationRecord

  validates :title, presence: true, length: { minimum: 3 }

  def done!
    self.update_attributes(done: true) if !self.done
  end


end
