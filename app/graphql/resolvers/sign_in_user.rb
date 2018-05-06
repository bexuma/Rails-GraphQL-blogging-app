class Resolvers::SignInUser < GraphQL::Function
  argument :email, !Types::AuthProviderEmailInput

  # defines inline return type for the mutation

  # type Types::AuthenticateType

  type do
    name 'SigninPayload'

    field :token, types.String
    field :user, Types::UserType
  end

  def call(obj, args, ctx)
    input = args[:email]

    # basic validation
    return unless input

    user = User.find_by(email: input[:email])

    # ensures we have the correct user
    return unless user
    return unless user.authenticate(input[:password])

    OpenStruct.new({
      token: AuthToken.token(user),
      user: user
    })

  end
end
