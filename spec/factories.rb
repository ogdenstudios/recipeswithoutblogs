FactoryBot.define do

    factory :user do 
        email { "#{(0...8).map { (65 + rand(26)).chr }.join}@ogdenstudios.xyz" }
        password { "password" }
    end
  
    factory :recipe do
        association :user, factory: :user
        title {"Test recipe title"}
        description {"A short description"}
        picture { Rack::Test::UploadedFile.new(Rails.root.join('app/assets/images/vegan-chocolate-cinnamon-babka.jpg'), 'image/jpeg') }
        meal_category {"breakfast"}
    end

    factory :ingredient do 
        association :recipe, factory: :recipe
        name { "salt" }
    end
  end