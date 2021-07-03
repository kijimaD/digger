# frozen_string_literal: true

RSpec.describe Stats do
  it '#add_message' do
    stats = described_class.new
    expect { stats.add_message('test') }.to change { stats.messages.count }.from(0).to(1)
  end
end
