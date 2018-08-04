class Item < ApplicationRecord
  def self.find(id)
    response = Request.get("item/#{id}")
    Recipe.new(response)
  end
end
