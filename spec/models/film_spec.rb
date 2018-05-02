RSpec.describe Film do

  describe 'validations' do
    describe 'require fields' do
      it 'should be invalide if missing a title' do
        film = Film.create(year: 2006, box_office_sales: 250_000_000)
        expect(film).to_not be_valid
      end
      it "is invalid without a name" do
        film = Film.new(name: nil)
        expect(film).to_not be_valid
      end
      it "is valid with a name" do
        film = Film.new(name: 'Bob')
        expect(film).to be_valid
      end
    end
  end
  describe 'Class Methods' do
    describe 'total_box_office_sales' do
      it 'should present a total of all box office sales' do
        Film.create(title: 'Mean Girls', year: 2006, box_office_sales: 250_000_000)
        Film.create(title: 'Mean Girls 2', year: 2007, box_office_sales: 25_000)
        Film.create(title: 'Mean Girls 3', year: 20010, box_office_sales: 2_500)

        expect(Film.total_box_office_sales).to eq(250027500)
      end
    end
  end
  describe 'average box office sales' do
    it 'should present an average of all box office sales' do
      Film.create(title: 'Mean Girls', year: 2006, box_office_sales: 250_000_000)
      Film.create(title: 'Mean Girls 2', year: 2007, box_office_sales: 25_000)
      Film.create(title: 'Mean Girls 3', year: 20010, box_office_sales: 2_500)

      expect(Film.average_box_office_sales).to eq(83342500)
    end
  end
end
