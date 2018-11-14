class Player
  def hand
    # コンソールを入力待ち状態にし、プレイヤーがコンソールから打ち込んだ値を出力する処理のメソッドの処理をこの中に作成する
    menu = ["1: グー", "2: チョキ", "3: パー"]
    menu.each do |m|
      puts m
    end
    player_hand = gets.to_i
  end
end

class Enemy
  def hand
    # グー、チョキ、パーの値をランダムに出力するメソッドの処理をこの中に作成する
    enemy_hand = rand(3)
  end
end

class Janken
  def pon(player_hand, enemy_hand)
    # プレイヤーが打ち込んだ値と、Enemyがランダムに出した値でじゃんけんをさせ、その結果をコンソール上に出力するメソッドをこの中に作成する
    # その際、あいこもしくはグー、チョキ、パー以外の値入力時には、もう一度ジャンケンをする
    # 相手がグー、チョキ、パーのうち、何を出したのかも表示させる
    hands = ["グー", "チョキ", "パー"]
    
    if player_hand == 0 || player_hand > hands.length
      puts "無効な値です。もう１回！"
      Janken.new.pon(Player.new.hand, Enemy.new.hand)
    elsif (player_hand - 1 - enemy_hand + 3) % 3 == 2
      puts "相手の手は#{hands[enemy_hand]}です。あなたの勝ちです"
    elsif (player_hand - 1 - enemy_hand + 3) % 3 == 1
      puts "相手の手は#{hands[enemy_hand]}です。あなたの負けです"
    elsif (player_hand - 1 - enemy_hand + 3) % 3 == 0
      puts "あいこで"
      Janken.new.pon(Player.new.hand, Enemy.new.hand)
    end
  end
end

player = Player.new
enemy = Enemy.new
janken = Janken.new

puts "じゃんけんゲームです(^ ^)\n数字を入力して下さい。"
# 下記の記述で、ジャンケンメソッドが起動される
janken.pon(player.hand, enemy.hand)




















# hands = ["グー", "チョキ", "パー"]

# while true
#   menu = ["数字を入力してください", "0: グー", "1: チョキ", "2: パー"]
#   menu.each do |m|
#     puts m
#   end
  
#   player_hand = gets.to_i
#   enemy_hand = rand(hands.length)
  
#   if player_hand > hands.length
#     puts "無効な数字です。もう１回"
#   elsif  (player_hand - enemy_hand + 3) % 3 == 2
#     break judge = "勝ち"
#   elsif (player_hand - enemy_hand + 3) % 3 == 1
#     break judge = "負け"
#   elsif (player_hand - enemy_hand + 3) % 3 == 0
#     puts "あいこで"
#   end
# end

# puts "相手の手は#{hands[enemy_hand]}です。あなたの#{judge}です"