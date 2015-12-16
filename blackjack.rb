#!/usr/bin/env ruby
# encoding: utf-8

require_relative 'lib/blackjack'
require 'highline/import'

def start
  say 'Hello!'
  dealer = Dealer.new
  dealer.new_game
end

start if __FILE__ == $PROGRAM_NAME
