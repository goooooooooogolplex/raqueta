# -*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'coffee-script'

configure :production do
end

before '/' do
  @court = ["舞鶴", "今津", "桧原", "春日公園", "西南の杜", "西部運動公園", "東平尾", "その他"]
  @price = [600, 800, 800, 325, 800, 800, 800, 0]
  @members = ["大野", "生田", "石崎", "岡崎", "岡本", "北島", "田上", "照屋", "久賀", "立石", "馬原", "戸浪", "梶原", "藤丸", "梅本", "赤井", "久田", "湯原", "酒井", "清水", "桑山", "松本", "豊福", "岩谷", "小山", "濱田", "中隈", "杉下", "尾崎", "その他"]
end

set :haml, :format => :html5

get '/' do
  haml :index
end

get %r{^/(.*)\.css$} do
  content_type 'text/css', :charset => 'utf-8'
  sass :"#{ params[:captures].first }"
end

get '/application.js' do
  coffee :application
end
