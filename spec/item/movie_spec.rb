require_relative '../../classes/item/movie'

describe Movie do
  before :each do
    @movie = Movie.new(true, Time.new.year - 3)
  end

  describe '#new' do
    it 'takes 2 params and returns a Movie object' do
      expect(@movie).to be_an_instance_of Movie
    end
  end

  describe 'instance variables' do
    it 'returns correct instance variables' do
      expect(@movie.silent).to eq(true)
    end
  end

  describe '#move_to_archive' do
    it 'sets archived true if movie is silent' do
      archive_status = @movie.move_to_archive
      expect(archive_status).to eq(true)
    end

    it 'sets archived true if is older than 10 years' do
      @movie = Movie.new(false, 2001)
      archive_status = @movie.move_to_archive
      expect(archive_status).to eq(true)
    end

    it 'sets archived false if movie is not silent & younger than 10 yrs' do
      @movie = Movie.new(false, Time.now.year - 2)
      expect(@movie.move_to_archive).to eq(false)
    end
  end
end
