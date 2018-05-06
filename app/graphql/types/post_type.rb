Types::PostType = GraphQL::ObjectType.define do
	name "Post"

	field :id, !types.ID
	field :title, !types.String
	field :content, !types.String
	# add postedBy field to Post type
	# - "-> { }": helps against loading issues between types
	# - "property": remaps field to an attribute of Post model
	field :postedBy, -> { Types::UserType }, property: :user
	
	rescue ActiveRecord::RecordInvalid => e
	# this would catch all validation errors and translate them to GraphQL::ExecutionError
		GraphQL::ExecutionError.new("Invalid input: #{e.record.errors.full_messages.join(', ')}")
	end

end
