require 'rails_helper'

RSpec.describe RequestControl, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:acceptance_criteria) }
  end
end
