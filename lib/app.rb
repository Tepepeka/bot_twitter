require 'twitter'
require 'dotenv'
require 'pry'

Dotenv.load('../.env')

def login_twitter
    client = Twitter::REST::Client.new do |config|
        config.consumer_key        = ENV["TWITTER_CONSUMER_KEY"]
        config.consumer_secret     = ENV["TWITTER_CONSUMER_SECRET"]
        config.access_token        = ENV["TWITTER_ACCESS_TOKEN"]
        config.access_token_secret = ENV["TWITTER_ACCESS_TOKEN_SECRET"]
    end
end


def update(client)
    client.update_with_media("TppK WorK MoDe [On]", open("../gif/work-working.gif"))
end


def follow(client)
    client.follow("serialkillza")
end


def search_tweet(client)
    tweet_id = client.user_timeline("serialkillza", count:3)
    #puts tweet_id
    tweet_id.each do |x|
       p x.full_text
    end
end


def favorite(client)
    tweet_id = client.user_timeline("serialkillza", count:3)
    client.favorite(tweet_id)
end



def search_words(client,words) 
    client.search(words.downcase, lang: "fr").take(3).each do |tweet|
        status = tweet.id
        text = tweet.full_text
        #p status
        #p text
        client.update_with_media("@#{tweet.user.screen_name}", open("../gif/work-working.gif"), in_reply_to_status_id: status)
    end
end


def test_like(client)
   
end



def perform
    #update(login_twitter)
    #follow(login_twitter)
    #search_words(login_twitter, "@tpmp")
    #search_tweet(login_twitter)
    test_like(login_twitter)
end

perform