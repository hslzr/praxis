require 'spec_helper'

RSpec.describe Player do
  before(:each) { @player = Player.new('test') }

  it 'has basic attributes' do
    expect(@player).to have_attributes( name: 'test',
                                        hp: 100,
                                        atk_power: 1
                                      )
  end

  describe '#damage' do
    it 'reduces player health' do
      expect{@player.damage(20)}.to change{@player.hp}.from(100).to(80)
    end

    it 'does not go below zero' do
      expect{@player.damage(200)}.to change{@player.hp}.from(100).to(0)
    end
  end

  describe '#heal' do
    it 'increases players health' do
      @player.hp = 50
      expect{@player.heal(50)}.to change{@player.hp}.from(50).to(100)
    end

    it 'does not to higher than max value' do
      @player.hp = 50
      expect{@player.heal(500)}.to change{@player.hp}
        .from(50)
        .to(Player::MAX_HIT_POINTS)
    end
  end

  describe '#alive?' do
    it 'returns true if HP > 0' do
      @player.hp = 1
      expect(@player.alive?).to be true
    end

    it 'returns false if HP = 0' do
      @player.hp = 0
      expect(@player.alive?).to be false
    end
  end
end
