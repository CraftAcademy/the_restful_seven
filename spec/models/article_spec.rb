require 'rails_helper'

RSpec.describe Article, type: :model do
  describe 'should contain the following columns' do
    it { is_expected.to have_db_column :id }
    it { is_expected.to have_db_column :title }
    it { is_expected.to have_db_column :content }
    it { is_expected.to have_db_column :author }
    it { is_expected.to have_db_column :created_at }
    it { is_expected.to have_db_column :updated_at }
  end

  describe 'Attachment' do
    it 'is valid' do
      subject.image.attach(io: File.open(fixture_path + '/dummy_image.png'), filename: 'dummy_image.png', content_type: 'image/png')
      expect(subject.image).to be_attached
    end
  end
end
