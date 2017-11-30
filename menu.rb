

require_relative 'deck'
require_relative 'bank'

class Menu


  def initialize
    loop do
      puts "Enter your name"
      @user_name = gets.chomp
      @deck = Deck.new
      @deck.give_out_cards
      puts "your cards #{@deck.user_cards}"

      @deck.user_points

      puts "your points #{@deck.user_sum}"
      @b = Bank.new
      @b.bet

      puts "Take card - 1
            Open cards - 2
            Skip a move - 3"
      choose = gets.chomp.to_i

      case choose
        when 1
          take
        when 2
          open
        when 3
          skip

      end

      break if @user_name == ""
    end
  end

  def take
    @deck.user_take_card
    puts "your cards #{@deck.user_cards}"

    @deck.user_points

    puts "your points #{@deck.user_sum}"

    if @deck.dealer_points < 18
      deal_take
    end

    open



  end

  def open
    puts "your cards #{@deck.user_cards}"

    @deck.user_points

    puts "your points #{@deck.user_sum}"

    puts "dealer cards #{@deck.dealer_cards}"

    @deck.dealer_points

    puts "dealer points #{@deck.dealer_sum}"

    if @deck.user_points > @deck.dealer_points
      @b.user_win
      puts "you win"
      puts "your bank #{@b.user_bank}"
      puts "dealer bank #{@b.dealer_bank}"
    elsif @deck.user_points < @deck.dealer_points
      @b.dealer_win
      puts "dealer win"
      puts "your bank #{@b.user_bank}"
      puts "dealer bank #{@b.dealer_bank}"
    else
      puts "it's draw"
      puts "your bank #{@b.user_bank}"
      puts "dealer bank #{@b.dealer_bank}"
    end
  end

  def deal_take
    @deck.dealer_take_card
  end

  def skip
    puts "your cards #{@deck.user_cards}"

    @deck.user_points

    puts "your points #{@deck.user_sum}"

    if @deck.dealer_points < 18
      deal_take
    end
  end

end




