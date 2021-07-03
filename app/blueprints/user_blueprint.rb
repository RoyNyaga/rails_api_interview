Blueprinter.configure do |config|
  config.sort_fields_by = :definition
end

class UserBlueprint < Blueprinter::Base
  identifier :id
  fields :name, :email

  view :index do 
    field :name
    field :email
    field :is_admin
    association :posts, blueprint: PostBlueprint
  end 


end 