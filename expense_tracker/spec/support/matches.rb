RSpec::Matchers.define :have_a_balnce_of do |amount|
  chain(:as_of) { |date| @as_of_date = date }
  #match { |account| account_balance(account) == amount }
  match { |account| values_match?(amount, account_balance(account)) }

  failure_message { |account| super() + failure_reason(account) }
  failure_message_when_negated { |account| super() + failure_reason(account) }

  private

  def failure_reason(account)
    ", but has a balance of #{account.current_balance}"
  end

  def accont_balance(account)
    if @as_of_date
      account.balance_as_of(@as_of_date)
    else
      account.current_balance
    end
  end
end

class HaveABalanceOf
  include RSpec::Matchers::Composable

  def initialize(amount)
    @amount = amount
  end

  def as_of(date)
    @as_of_date = date
    self
  end

  def description
    if @as_of_date
      "have a balance of #{description_of(@amount)} as of #{@as_of_date}"
    else
      "have a balance of #{description_of(@mount)}"
    end
  end

  def failure_messages
    "expected #{@account.inspect} to #{description}" + failure_reason
  end

  def failure_message_when_negated
    "expected #{@account.inspect} not to #{description}" + failure_reason
  end

  private
  def failure_reason(account)
    ", but has a balance of #{account.current_balance}"
  end

  def accont_balance(account)
    if @as_of_date
      account.balance_as_of(@as_of_date)
    else
      account.current_balance
    end
  end
end

module AccountMatchers
  def have_a_balance_of(ammount)
    HaveABalanceOf.new(ammount)
  end
end

RSpec.configure do |config|
  config.include AccountMatchers
end
