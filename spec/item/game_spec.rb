require_relative '../../classes/item/game'

describe Game do
  before :each do
    @game = Game.new(true, 2005, 2004)
  end

  describe '#new' do
    it 'takes 3 params and returns a Game object' do
      expect(@game).to be_an_instance_of Game
    end
  end

  describe 'instance variables' do
    it 'returns correct instance variables' do
      expect(@game.multiplayer).to eq(true)
      expect(@game.last_played_at).to eq(Time.new('2005'))
    end
  end

  describe '#move_to_archive' do
    it 'sets archived false if last played is less than 2 yrs' do
      @game = Game.new(true, Time.new.year - 1, 2001)
      archive_status = @game.move_to_archive
      expect(archive_status).to eq(false)
    end

    it 'sets archived false if not older than 10 years' do
      archive_status = @game.move_to_archive
      expect(archive_status).to eq(false)
    end

    it 'sets archived true if last played > 2 & older than 10 yrs' do
      @game = Game.new(true, Time.new.year - 3, Time.new.year - 12)
      expect(@game.move_to_archive).to eq(false)
    end
  end
end
