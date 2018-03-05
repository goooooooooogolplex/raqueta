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
  @members = ["大野", "生田", "藤丸", "岩谷", "立石", "久田", "石橋", "小佐々", "アンディ", "外山", "西", "畠山", "佐野", "田上", "髙木", "米井", "新原", "大西", "岡本", "北島", "戸浪", "岡崎", "梶原", "赤井"]
  @guests = ["ゲスト"] * 8
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
