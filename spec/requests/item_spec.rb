# frozen_string_literal: true

RSpec.describe Item do
  let(:object_pool) { ObjectPool.new }

  before { World.new(object_pool, 'test_map.txt') }

  describe 'Character collide with item' do
    context 'when Player input' do
      let!(:character) { Character.new(object_pool, PlayerInput.new(object_pool), 2, 2) }
      let(:inventory) { Inventory.send(:new) }

      before do
        Inventory.send(:new)
        described_class.new(object_pool, 3, 3, ItemType.new('portion', '回復役', '回復する', :consumption))
      end

      it 'Get item' do
        expect { character.physics.move_to(3, 3) }.to change { Inventory.instance.items.length }.by(1)
      end

      it 'Remove item on world after collide' do
        character.physics.move_to(3, 3)
        object_pool.update_all
        expect(object_pool.same_point_objects(3, 3, character)).to eq([])
      end
    end

    context 'when AI input' do
      let!(:character) { Character.new(object_pool, AiInput.new(object_pool), 2, 2) }

      before do
        Inventory.send(:new)
        described_class.new(object_pool, 3, 3, ItemType.new('portion', '回復役', '回復する', :consumption))
      end

      it 'Not get item' do
        expect { character.physics.move_to(3, 3) }.to change { Inventory.instance.items.length }.by(0)
      end

      it 'Not affect item object existent' do
        character.physics.move_to(3, 3)
        object_pool.update_all
        expect(object_pool.same_point_objects(3, 3, character).length).to eq(1)
      end
    end
  end
end
