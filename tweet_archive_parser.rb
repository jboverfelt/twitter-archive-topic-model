# Takes the csv file generated from a Twitter 
# archive download and outputs a file with
# just the tweet text for use in information
# retrieval applications

require 'csv'
require 'fileutils'

if ARGV.length == 1
  FileUtils.mkdir_p "tweets-data"
  tweet_text = File.open('tweets-data/tweets-text', 'w')

  CSV.foreach(ARGV[0], headers: true) do |tweet|
    tweet_text.puts tweet['text']
  end

  tweet_text.close
else
  raise "Usage: ruby tweet_archive_parser.rb [tweets csv file]"
end
