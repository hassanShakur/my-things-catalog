require_relative '../../classes/item/music_album'

describe MusicAlbum do
  before :each do
    @album = MusicAlbum.new(false, Time.now.year - 2)
  end

  describe '#new' do
    it 'takes 2 params and returns a MusicAlbum object' do
      expect(@album).to be_an_instance_of MusicAlbum
    end
  end

  describe 'instance variables' do
    it 'returns correct instance variables' do
      expect(@album.on_spotify).to eq(false)
      expect(@album.publish_date).to eq(Time.new(Time.now.year - 2))
    end
  end

  describe '#move_to_archive' do
    it 'sets archived false if not on spotify' do
      archive_status = @album.move_to_archive
      expect(archive_status).to eq(false)
    end

    it 'sets archived false if album is younger than 10 yrs' do
      @album = MusicAlbum.new(true, Time.now.year - 4)
      expect(@album.move_to_archive).to eq(false)
    end

    it 'sets archived true if is older than 10 years & on spotify' do
      @album = MusicAlbum.new(true, 2001)
      archive_status = @album.move_to_archive
      expect(archive_status).to eq(true)
    end
  end
end
