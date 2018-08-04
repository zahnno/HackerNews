class ItemsController < ApplicationController
  def index
    url = 'https://hacker-news.firebaseio.com/v0/'
    response = HTTParty.get(url + 'topstories.json')
    response = response.parsed_response
    @itemsList = []
    response[0...10].each { | item | 
      listItem = HTTParty.get(url + 'item/' + item.to_s + '.json')
      listItem = listItem.parsed_response
      listItem['shortUrl'] = parseHostUrl(listItem['url'])
      listItem['timeDifference'] = Time.at(listItem['time'])
      @itemsList.push(listItem);
    }
  end

  def parseHostUrl(url)
    return URI.parse(url).host;
  end
end
