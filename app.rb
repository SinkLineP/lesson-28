#encoding: utf-8
require 'rubygems'
require 'sinatra'
require 'sinatra/reloader'

def init_db
	@db = SQLite3::Database.new 'blizary.db'
	@db.results_as_hash = true
end

before do
	init_db
end

configure do
	db.execute 'CREATE TABLE "pots" 
	(
		id	INTEGER INTEGER PRIMARY KEY AUTOINCREMENT, 
		create_date	INTEGER, 
		content	TEXT
	);'
end

get '/' do
	erb "Hello! <a href=\"https://github.com/bootstrap-ruby/sinatra-bootstrap\">Original</a> pattern has been modified for <a href=\"http://rubyschool.us/\">Ruby School</a>"			
end

get '/new' do
	erb :new_post
end

post '/new' do
	@content = params[:content]
	erb "Text #{@content}"
end