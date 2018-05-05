class Resolvers::CreatePost < GraphQL::Function

  argument :title, !types.String
  argument :content, !types.String

  type Types::PostType

  def call(obj, args, _ctx)
    Post.create!(
      title: args[:title],
      content: args[:content]
    )
  end


end