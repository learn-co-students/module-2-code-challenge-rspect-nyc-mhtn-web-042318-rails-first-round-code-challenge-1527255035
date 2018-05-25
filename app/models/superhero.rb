class Superhero < ApplicationRecord
  belongs_to :superpower

  validates :super_name, uniqueness: true

  def self.search(search)

    if search == "super strength"
      search = 1
    elsif search == "flight"
      search = 2
    elsif search == "super human senses"
      search = 3
    elsif search == "elasticity"
      search = 4
    else
      search = search
    end

    where("name LIKE ? OR super_name LIKE ? OR superpower_id LIKE ?", "%#{search}", "#{search}%", "#{search}%")
  end

end
