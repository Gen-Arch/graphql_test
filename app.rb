require 'sinatra'
require 'sinatra/json' #=> sinatraでjson形式でレスポンスする為
require_relative 'graphql/appschema'

# sinatraでjsonリクエストを受け取れるようにしています。
require 'rack/contrib'
use Rack::PostBodyContentTypeParser

# grapfqlのリクエスト処理
post '/graphql' do
  content_type :json
  puts params[:query]
  result = AppSchema.execute(
    params[:query],
    variables: params[:variables],
    context: { current_user: nil },
  )
  json result
end
