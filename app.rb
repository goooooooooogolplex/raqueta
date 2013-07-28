# -*- coding: utf-8 -*-
require 'rubygems'
require 'sinatra'
require 'haml'
require 'sass'
require 'coffee-script'

configure :production do
end

before '/' do
  @members = ["大野", "生田", "岡崎"]
  @num_members = @members.length
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
