class Resolvers::CreatePost < GraphQL::Function

  argument :title, !types.String
  argument :content, !types.String

  type Types::PostType

  def call(obj, args, ctx)
    if ctx[:current_user].blank?
      raise GraphQL::ExecutionError.new("Authentication required")
    end

    Post.create!(
      title: args[:title],
      content: args[:content],
      user: ctx[:current_user]
    )
  end


end