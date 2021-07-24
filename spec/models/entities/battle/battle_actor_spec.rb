# frozen_string_literal: true

RSpec.describe BattleActor do
  it 'can run' do
    expect { described_class.new }.not_to raise_error
  end
end
