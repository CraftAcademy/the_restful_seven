FactoryBot.define do
  factory :user do
    email { "user@example.com" }
    password { "password" }
    password_confirmation { "password" }
    role { :user }
        
    factory :premium_user do 
      email { "premium_user@example.com" }
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