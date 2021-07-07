require 'rails_helper'

RSpec.describe RequestInformation, type: :model do
  describe '.amount_of_status' do
    it 'does return amount of status' do
      create(:request_information)
      create(:request_information)
      create(:request_information)
      expect(described_class.amount_of_status('301')).to eq(3)
    end
  end
  describe '.amount_of_paths' do
    it 'does return amount of paths' do
      create(:request_information)
      create(:request_information)
      create(:request_information)
      expect(described_class.amount_of_paths('/api-docs')).to eq(3)
    end
  end
  describe '.amount_of_ips' do
    it 'does return amount of ips' do
      create(:request_information)
      create(:request_information)
      create(:request_information)
      expect(described_class.amount_of_ips('127.0.0.1')).to eq(3)
    end
  end
  describe '.amount_of_ips' do
    it 'does return amount of ips' do
      create(:request_information, status_code: '429')
      create(:request_information, status_code: '429')
      create(:request_information)
      expect(described_class.amount_of_many_requests).to eq(2)
    end
  end
end
