require 'news-api'
require 'json'
require 'date'

now = Date.today
month = now-30

module FeedsService  
  
  def self.get_feed(query, source, domain)
    newsapi = News.new(Rails.application.credentials.news[:api_key])
    newsapi.get_everything(q: query,
                            sources: source,
                            domains: domain,
                            from: Date.today,
                            to: month,
                            language: 'en',
                            sortBy: 'relevancy'))
  end
end