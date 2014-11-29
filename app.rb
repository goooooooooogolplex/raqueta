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
  @members = ["大野", "生田", "石崎", "岡崎", "岡本", "北島", "田上", "久賀", "立石", "戸浪", "梶原", "藤丸", "赤井", "久田", "湯原", "岩谷", "濱田", "中隈", "尾崎", "紅林"]
  @guests = ["ゲスト"] * 5
  @members += @guests
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
