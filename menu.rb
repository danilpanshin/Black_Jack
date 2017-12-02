

require_relative 'deck'
require_relative 'bank'

class Menu
  def initialize
    puts 'Enter your name'
    @user_name = gets.chomp
    @b = Bank.new
    menu
  end

  def menu
    @deck = Deck.new
    @deck.give_out_cards
    puts "#{@user_name} cards #{@deck.user_cards}"

    @deck.user_points

    puts "#{@user_name} points #{@deck.user_sum}"

    puts 'dealer cards [* *]'

    @b.bet

    puts "Take card - 1
       Open cards - 2
       Skip a move - 3"
    choose = gets.chomp.to_i

    case choose
    when 1
      take
    when 2
      open_cards
    when 3
      skip

    end

    puts 'once more? yes/no'
    more = gets.chomp

    menu if more == 'yes'
  end

  def take
    @deck.user_take_card

    @deck.user_points

    deal_take if @deck.dealer_points < 18

    open_cards
  end

  def open_cards
    puts "#{@user_name} cards: #{@deck.user_cards}"

    @deck.user_points

    puts "#{@user_name} points: #{@deck.user_sum}"

    puts "dealer cards #{@deck.dealer_cards}"

    @deck.dealer_points

    puts "dealer points #{@deck.dealer_sum}"

    if @deck.user_points > 21 && @deck.dealer_points > 21
      @b.draw
      puts "it's draw"
      puts "#{@user_name} bank #{@b.user_bank}"
      puts "dealer bank #{@b.dealer_bank}"

    elsif @deck.user_points > 21
      @b.dealer_win
      puts 'dealer win'
      puts "#{@user_name} bank #{@b.user_bank}"
      puts "dealer bank #{@b.dealer_bank}"
    elsif @deck.dealer_points > 21
      @b.user_win
      puts "#{@user_name} win"
      puts "#{@user_name} bank #{@b.user_bank}"
      puts "dealer bank #{@b.dealer_bank}"
    elsif @deck.user_points > @deck.dealer_points
      @b.user_win
      puts "#{@user_name} win"
      puts "#{@user_name} bank #{@b.user_bank}"
      puts "dealer bank #{@b.dealer_bank}"
    elsif @deck.user_points < @deck.dealer_points
      @b.dealer_win
      puts 'dealer win'
      puts "#{@user_name} bank #{@b.user_bank}"
      puts "dealer bank #{@b.dealer_bank}"

    elsif @deck.dealer_points == @deck.user_points
      @b.draw
      puts "it's draw"
      puts "#{@user_name} bank #{@b.user_bank}"
      puts "dealer bank #{@b.dealer_bank}"
    end

    if @b.user_bank.zero?
      puts "Game over. #{@user_name} loose. Start new game? yes/no"
      start = gets.chomp
      if start == 'yes'
        Menu.new
      elsif start == 'no'
        abort
      end
    elsif @b.dealer_bank.zero?
      puts 'Game over. Dealer loose. Start new game? yes/no'
      start = gets.chomp
      if start == 'yes'
        Menu.new
      elsif start == 'no'
        abort
      end
    end
  end

  def deal_take
    @deck.dealer_take_card
  end

  def skip
    puts "#{@user_name} cards #{@deck.user_cards}"

    @deck.user_points

    puts "#{@user_name} points #{@deck.user_sum}"

    deal_take if @deck.dealer_points < 18

    if @deck.dealer_cards.length == 2
      puts 'dealer cards [* *]'
    elsif @deck.dealer_cards.length == 3
      puts 'dealer cards [* * *]'
    end
    puts "Take card - 1
     Open cards - 2
     Skip a move - 3"
    choose = gets.chomp.to_i

    case choose
    when 1
      take
    when 2
      open_cards
    when 3
      skip

      # menu
    end
  end
end
