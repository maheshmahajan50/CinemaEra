require 'rails_helper'

RSpec.describe Review, type: :model do
  describe 'associations' do
    it { is_expected.to belong_to(:movie) }
  end

  describe 'validations' do
    it { is_expected.to validate_presence_of :description }
    it { is_expected.to validate_presence_of :rating }
    it { is_expected.to validate_presence_of :email }
  end
end
