require 'rails_helper'

RSpec.describe RequestControl, type: :model do
  describe 'validations' do
    it { should validate_presence_of(:max_request_origin_ip) }
    it { should validate_presence_of(:period_seconds) }
  end
end
