require 'date'

Calendar = Struct.new(:date_string) do
  def on_weekend?
    date = Date.parse(date_string)
    date.saturday? || date.sunday?
  end
end
RSpec.describe Calendar do
  let(:sunday_date) { Calendar.new('Sun, 11 Jun 2017') }

  it 'considers sunday to be on the weekend' do
    expect(sunday_date).to be_on_weekend
  end
end
