# require "apollo/tracing"

RailsApolloSchema = GraphQL::Schema.define do
  mutation(Types::MutationType)
  query(Types::QueryType)
  # use ApolloTracing.new
end
