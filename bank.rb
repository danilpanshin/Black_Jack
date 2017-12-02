class Bank

  attr_accessor :user_bank, :dealer_bank

  def initialize
    @user_bank = 20
    @dealer_bank = 20
  end

  def bet
    @bank = 20
    @user_bank -= 10
    @dealer_bank -= 10
  end

  def user_win
    @user_bank += @bank
  end

  def dealer_win
    @dealer_bank += @bank
  end

  def draw
    @bank = 0
    @user_bank += 10
    @dealer_bank += 10
  end
end