Blueprinter.configure do |config|
  config.sort_fields_by = :definition
end

class UserBlueprint < Blueprinter::Base
  identifier :id

    field :name
    field :email
    association :posts, blueprint: PostBlueprint
    association :comments, blueprint: CommentBlueprint

end 