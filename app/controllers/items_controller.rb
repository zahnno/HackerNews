class ItemsController < ApplicationController
  def index
    url = 'https://hacker-news.firebaseio.com/v0/'
    response = HTTParty.get(url + 'topstories.json')
    response = response.parsed_response
    @items = []
    response[0...4].each { | item | 
      toBeStaged = HTTParty.get(url + 'item/' + item.to_s + '.json')
      toBeStaged = toBeStaged.parsed_response
      @items.push(toBeStaged);
    }
  end
end

# https://hacker-news.firebaseio.com/v0/item/17685358.json
