class User < ApplicationRecord
  has_many :surveys

  def name
    first_name + " " + last_name
  end
end
