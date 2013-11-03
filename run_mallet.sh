#!/bin/bash

EXPECTED_ARGS=2

if [ $# -ne $EXPECTED_ARGS ] 
  then
    echo "Usage: run_mallet.sh [location of MALLET executable] [tweets csv file]" 
    exit 0
fi

MALLET_EXECUTABLE=$1
TWEETS_CSV=$2

ruby tweet_archive_parser.rb $TWEETS_CSV 

$MALLET_EXECUTABLE import-dir --input tweets-data/ --output tweets-sequence.mallet --keep-sequence --remove-stopwords

$MALLET_EXECUTABLE train-topics --input tweets-sequence.mallet --num-topics 7 --output-topic-keys tweets-keys --num-iterations 100 --num-top-words 15

cat tweets-keys
