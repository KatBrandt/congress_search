require 'rails_helper'

describe User, type: :model do
  describe 'Validations' do
    it { should validate_presence_of :username }
    it { should validate_uniqueness_of :username }
    it { should validate_presence_of :password }
  end
end
