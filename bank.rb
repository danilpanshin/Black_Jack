class Bank
  def initialize
    @user_bank = 100
    @dealer_bank = 100
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
end