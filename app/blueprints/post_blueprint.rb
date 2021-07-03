Blueprinter.configure do |config|
  config.sort_fields_by = :definition
end

class PostBlueprint < Blueprinter::Base
  identifier :id 

  fields :content
  association :comments, blueprint: CommentBlueprint
end 