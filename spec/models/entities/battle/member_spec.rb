# frozen_string_literal: true

RSpec.describe Member do
  let(:member) { described_class.new('id', 'name') }

  describe '#initialize' do
    it 'can run' do
      expect { member }.not_to raise_error
    end
  end
end
