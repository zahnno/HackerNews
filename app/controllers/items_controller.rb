class ItemsController < ApplicationController
  URL = 'https://hacker-news.firebaseio.com/v0/'
  WEBSITE = 'https://news.ycombinator.com/'
  def index
    response = HTTParty.get(URL + 'topstories.json')
    response = response.parsed_response
    @itemsList = []
    loadArticles(0, response)
  end

  def parseHostUrl(url)
    return URI.parse(url).host if url
  end

  def loadArticles(indexStart, response)
    indexEnd = indexStart + 30
    response[indexStart...5].each { | item | 
      listItem = HTTParty.get(URL + 'item/' + item.to_s + '.json')
      listItem = listItem.parsed_response
      listItem['shortUrl'] = parseHostUrl(listItem['url'])
      listItem['timeDifference'] = Time.at(listItem['time'])
      listItem['commentUrl'] = WEBSITE + 'item?id=' + item.to_s
      @itemsList.push(listItem)
    }
  end
end
