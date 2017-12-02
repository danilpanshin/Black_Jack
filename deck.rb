class Deck
  attr_accessor :user_cards, :dealer_cards, :cards, :user_sum, :dealer_sum

  def initialize
    @cards = ['2+', '3+', '4+', '5+', '6+', '7+', '8+', '9+', '10+', 'K+', 'Q+', 'J+', 'A+',
              '2<3', '3<3', '4<3', '5<3', '6<3', '7<3', '8<3', '9<3', '10<3', 'K<3', 'Q<3', 'J<3', 'A<3',
              '2<>', '3<>', '4<>', '5<>', '6<>', '7<>', '8<>', '9<>', '10<>', 'K<>', 'Q<>', 'J<>', 'A<>',
              '2^', '3^', '4^', '5^', '6^', '7^', '8^', '9^', '10^', 'K^', 'Q^', 'J^', 'A^']
    @cards.shuffle!
    give_out_cards
  end

  def give_out_cards
    @user_cards = @cards.sample(2)
    @cards.delete(@user_cards.first)
    @cards.delete(@user_cards.last)
    @dealer_cards = @cards.sample(2)
    @cards.delete(@dealer_cards.first)
    @cards.delete(@dealer_cards.last)
    @user_cards
  end

  def user_take_card
    new_card = @cards.sample
    @cards.delete(new_card)
    @user_cards << new_card
  end

  def dealer_take_card
    new_card = @cards.sample
    @cards.delete(new_card)
    @dealer_cards << new_card
  end

  def user_points
    sum = 0
    pic_sum = 0
    ace_sum = 0
    @user_sum = 0
    numbers = @user_cards.select { |x| x =~ /[0-9]/ }
    numbers.map!(&:to_i)
    numbers.each { |x| sum += x }
    pictures = @user_cards.select { |x| x =~ /[JQK]/ }
    pictures.each { |_x| pic_sum += 10 }

    aces = @user_cards.select { |x| x =~ /[A]/ }

    @user_sum = pic_sum + sum

    aces.each { |_x| ace_sum = 11 if @user_sum <= 10 }
    aces.each { |_x| ace_sum = 1 if @user_sum > 10 }
    if aces.length == 2
      ace_sum = 12
    elsif aces.length == 3
      ace_sum = 13
    end

    @user_sum += ace_sum
  end

  def dealer_points
    sum = 0
    pic_sum = 0
    ace_sum = 0
    @dealer_sum = 0
    numbers = @dealer_cards.select { |x| x =~ /[0-9]/ }
    numbers.map!(&:to_i)
    numbers.each { |x| sum += x }
    pictures = @dealer_cards.select { |x| x =~ /[JQK]/ }
    pictures.each { |_x| pic_sum += 10 }

    aces = @dealer_cards.select { |x| x =~ /[A]/ }

    @dealer_sum = pic_sum + sum

    aces.each { |_x| ace_sum = 11 if @dealer_sum <= 10 }
    aces.each { |_x| ace_sum = 1 if @dealer_sum > 10 }
    if aces.length == 2
      ace_sum = 12
    elsif aces.length == 3
      ace_sum = 13
    end

    @dealer_sum += ace_sum
  end
end
