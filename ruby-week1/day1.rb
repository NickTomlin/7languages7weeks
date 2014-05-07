p "Hello world"

# print the string "this is sentence number 1" where the number 1 changes from 1 to 10
1.upto(10) {|x| p "this is sentence number #{x}"}
# alternately, ``1..10.times {|x| ... }``

num = rand(10)
p "I have generated a random number between 1 and 10"
p "what is it?"
while true do
  guess = gets.to_i
  if guess == num
    puts "you got it!"
    break
  elsif guess > num
    puts "Too damn high"
  elsif
    puts "Too damn low"
  end
end
