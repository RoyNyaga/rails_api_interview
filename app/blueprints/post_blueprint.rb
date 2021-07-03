Blueprinter.configure do |config|
  config.sort_fields_by = :definition
end

class PostBlueprint < Blueprinter::Base
  identifier :id 

  fields :content
  association :comments, blueprint: CommentBlueprint

  view :show do
    field :content
    association :user, blueprint: UserBlueprint
    association :comments, blueprint: CommentBlueprint
  end
end 