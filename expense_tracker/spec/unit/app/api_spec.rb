require_relative '../../../app/api'

module ExpenseTracker
  RecordResult = Struct.new(:success?, :expense_id, :error_message)

  RSpec.describe API do

    def app
      API.new(ledger: ledger)
    end

    let(:ledger) { instance_double('ExpenseTracker::Ledger') }

    describe 'POST /expenses' do
      let(:expense) { { 'some' => 'data' } }

      def parse_and_check_response(last_response, include_hash)
        parsed = JSON.parse(last_response.body)
        expect(parsed).to include(include_hash)
      end

      context 'when the expense is successfully recorded' do

        before do
          allow(ledger).to receive(:record)
            .with(expense)
            .and_return(RecordResult.new(true, 417, nil))
        end

        it 'returns the expense id' do
          post '/expenses', JSON.generate(expense)

          parse_and_check_response(last_response, {'expense_id' => 417})
        end

        it 'responds with a 200 (OK)' do
          post '/expenses', JSON.generate(expense)
          expect(last_response.status).to eq(200)
        end
      end

      context 'when the expense fails validation' do

        before do
          allow(ledger).to receive(:record)
            .with(expense)
            .and_return(RecordResult.new(false, 417, "Expense incomplete"))
        end

        it 'returns an error message' do
          post '/expenses', JSON.generate(expense)

          parse_and_check_response(last_response, {'error' => 'Expense incomplete'})
        end
        it 'responds with a 422 (Unprocessable entity)' do
          post '/expenses', JSON.generate(expense)
          expect(last_response.status).to eq(422)
        end
      end
    end

    describe 'GET /expenses/:date' do
      let(:date) { '2017-06-10' }
      context 'when expenses exist on the give date' do
        before do
          allow(ledger).to receive(:expense_on)
            .with(:date)
            .and_return({ 'some' => 'data' })
        end
        it 'returns the expense records as JSON' do
          get '/expenses/' << date
          parsed = JSON.parse(last_response.body)
          expect(parsed).to eq({ 'some' => 'data' })
        end
        it 'responds with a 200 (OK)' do
          get '/expenses/' << date
          expect(last_response.status).to eq(200)
        end
      end

      context 'when there are no expenses on the given date' do
        before do
          allow(ledger).to receive(:expense_on)
            .with(date)
            .and_return([])
        end
        it 'returns an empty array as JSON' do
          get '/expenses/' << date
          parsed = JSON.parse(last_response.body)
          expect(parsed).to eq([])
        end
        it 'responds with a 200 (OK)' do
          get '/expenses/' << date
          expect(last_response.status).to eq(200)
        end

      end

    end
  end
end
