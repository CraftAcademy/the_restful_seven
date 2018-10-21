require 'news-api'
require 'json'
require 'date'

module FeedService
  
  def self.get_feed(query, source, domain, pagesize)
    newsapi = News.new(Rails.application.credentials.news[:api_key])
    newsapi.get_everything(q: query,
                            sources: source,
                            domains: domain,
                            pageSize: pagesize,
                            language: 'en')
                            
  end
end