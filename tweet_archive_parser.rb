# Takes the csv file generated from a Twitter 
# archive download and outputs a file with
# just the tweet text for use in information
# retrieval applications

require 'csv'

tweet_text = File.open('tweets-text', 'w')

CSV.foreach('tweets.csv', headers: true) do |tweet|
  tweet_text.puts tweet['text']
end

tweet_text.close
