require 'rails_helper'

RSpec.describe Category, type: :model do
  describe 'should contain the following columns' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :name }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end
end
