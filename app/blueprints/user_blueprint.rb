class UserBlueprint < Blueprinter::Base
  identifier :id

  fields :name, :email
  association :posts, blueprint: PostBlueprint
end 