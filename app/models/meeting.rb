class Meeting < ApplicationRecord
  has_many :highlights

  def as_json(options={})
    super(include: :highlights)
  end
end
