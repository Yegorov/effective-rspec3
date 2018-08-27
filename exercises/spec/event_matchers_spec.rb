RSpec::Matchers.define :have_no_ticlets_sold do
  match do |event|
    event.tickets_sold.empty?
  end

  failure_message { |event| super() + failure_reason(event) }
  failure_message_when_negated { |event| super() + failure_reason(event) }

  private

  def failure_reason(event)
    ", but has a sold tickets for #{event.tickets_sold}"
  end

end

RSpec::Matchers.define :be_sold_out do
  match do |event|
    event.tickets_sold.count == event.capacity
  end

  failure_message { |event| super() + failure_reason(event) }
  failure_message_when_negated { |event| super() + failure_reason(event) }

  private

  def failure_reason(event)
    ", but has a sold tickets #{event.tickets_sold.count} count, capacity: #{event.capacity}"
  end

end

Event = Struct.new(:name, :capacity) do
  def purchase_ticket_for(guest)
    tickets_sold << guest
  end

  def tickets_sold
    @tickets_sold ||= []
  end

  def inspect
    "#<Event #{name.inspect} (#{capacity})>"
  end
end

RSpec.describe '`have_no_ticlets_sold` matcher' do
  example 'passing expectation' do
    art_show = Event.new('Art Show', 100)
    expect(art_show).to have_no_ticlets_sold
  end
  example 'failing expection' do
    art_show = Event.new('Art Show', 100)
    art_show.purchase_ticket_for(:a_friend)

    expect(art_show).not_to have_no_ticlets_sold
  end
end


RSpec.describe '`be_sold_out` matcher' do
  example 'passing expectation' do
    u2_concert = Event.new('U2 Concert', 10_000)
    10_000.times { u2_concert.purchase_ticket_for(:a_fan) }

    expect(u2_concert).to be_sold_out
  end

  example 'failing expectation' do
    u2_concert = Event.new('U2 Concert', 10_000)
    9_900.times { u2_concert.purchase_ticket_for(:a_fan) }

    expect(u2_concert).to be_sold_out
  end
end
