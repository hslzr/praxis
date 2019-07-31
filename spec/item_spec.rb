require 'spec_helper'

RSpec.describe Item do
  before(:each) { @item = Item.new(0, "Test") }

  it 'has basic attributes' do
    expect(@item).to have_attributes( index: 0,
                                      name: 'Test')
  end

  describe '#usable?' do
    context 'when :uses attr is nil' do
      it 'returns false' do
        item = Item.new(0, 'uses_nil')
        expect(item.usable?).to be false
      end
    end

    context 'when :uses is zero' do
      it 'returns false' do
        item = Item.new(0, 'uses_zero', uses: 0)
        expect(item.usable?).to be false
      end
    end

    context 'when :uses is greater than zero' do
      it 'returns true' do
        item = Item.new(0, 'uses_true', uses: 3)
        expect(item.usable?).to be true
      end
    end
  end

  describe '#use' do
    context 'when not usable' do
      it 'returns nil' do
        item = Item.new(0, 'not_usable')
        expect(item.use).to be nil
      end
    end

    context 'when :uses is zero' do
      it 'returns nil' do
        item = Item.new(0, 'uses_zero', uses: 0)
        expect(item.use).to be nil
      end
    end

    context 'when IS usable' do
      it 'reduces :uses by 1' do
        item = Item.new(1, 'usable_item', uses: 3)
        expect{item.use}.to change{item.uses}.from(3).to(2)
      end
    end
  end

  describe '#warn_for_uses' do
    context 'when :uses > 3' do
      it 'returns nil' do
        item = Item.new(1, 'uses_gt_3', uses: 5)
        expect(item.send(:warn_for_uses)).to be nil
      end
    end

    context 'when :uses > 0 && :uses <= 3' do
      it 'prints a warning' do
        item = Item.new(1, 'uses_gt_3', uses: 3)
        expect(item.send(:warn_for_uses)). to eq :warning
      end
    end

    context 'when :uses is zero' do
      it 'prints a fatal warning' do
        item = Item.new(1, 'uses_gt_3', uses: 1)
        expect(item.send(:warn_for_uses)). to eq :fatal
      end
    end
  end
end
