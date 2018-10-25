FactoryBot.define do
  factory :user do
    password { "password" }
    
    factory :standard_user do
      email { "standard@example.com" }
      role { :standard_user }
    end
    
    factory :premium_user do 
      email { "premium@example.com" }
      role { :premium_user }
    end
    
    factory :author do 
      email { "author@example.com" }
      role { :author }
    end

    factory :editor do 
      email { "editor@example.com" }
      role { :editor }
    end
  end
end