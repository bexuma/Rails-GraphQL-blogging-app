# This file is used by Rack-based servers to start the application.

require_relative 'config/environment'

# ApolloTracing.start_proxy('config/apollo-engine-proxy.json')
# or pass a JSON string:
# ApolloTracing.start_proxy('{"apiKey": "KEY", ...}')

run Rails.application
