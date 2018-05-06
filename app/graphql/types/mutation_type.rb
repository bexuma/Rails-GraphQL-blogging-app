Types::MutationType = GraphQL::ObjectType.define do
  name "Mutation"

  field :createPost, function: Resolvers::CreatePost.new
  field :createUser, function: Resolvers::CreateUser.new
  field :signInUser, function: Resolvers::SignInUser.new

end
