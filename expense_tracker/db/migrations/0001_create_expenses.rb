Sequel.migration do
  change do
    create_table :expenses do
      primary_key :id
      String :payee
      Float :amount
      Date :date
    end
  end
end

# bundle exec sequel -m ./db/migrations sqlite://db/development.db --echo
