class DeviseTokenAuthUpdateUsers < ActiveRecord::Migration[5.2]
  def change    
    add_column :users, :provider, :string, null: false, default: 'email'
    add_column :users, :uid, :string, null: false, default: ''
    add_column :users, :tokens, :text
    add_column :users, :confirmation_token, :string
    add_column :users, :confirmed_at, :datetime
    add_column :users, :confirmation_sent_at, :datetime
    User.reset_column_information
    User.find_each do |user|
      user.uid = user.email
      user.provider = 'email'
      user.save!
    end
    add_index :users, [:uid, :provider], unique: true
  end
end
