require 'news-api'
require 'json'
require 'date'

now = Date.today
month = now-30

module FeedService
  
  def self.get_feed(query, source, domain)
    newsapi = News.new(Rails.application.credentials.news[:api_key])
    newsapi.get_everything(q: query,
                            sources: source,
                            domains: domain,
                            language: 'en')
                            # sortBy: 'relevancy')
                            
  end

  def self.top_news(query, source, domain)
    newsapi = News.new(Rails.application.credentials.news[:api_key])
    newsapi.get_everything(q: query,
                           sources: source,
                           domains: domain,
                           language: 'en',
                           pageSize: 1)

  end
end


                            # from: Date.today,
                            # to: month,
