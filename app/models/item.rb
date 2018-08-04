class Item < ApplicationRecord
  def self.find(id)
    response = Request.get("item/#{id}")
    puts response;
    # Item.new(response)
  end
end
