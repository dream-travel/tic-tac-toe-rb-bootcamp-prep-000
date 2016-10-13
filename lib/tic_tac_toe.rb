WIN_COMBINATIONS = [
  [0,1,2],
  [3,4,5],
  [6,7,8],
  [0,3,6],
  [1,4,7],
  [2,5,8],
  [0,4,8],
  [2,4,6]
]

def display_board(board)
  puts " #{board[0]} | #{board[1]} | #{board[2]} "
  puts "-----------"
  puts " #{board[3]} | #{board[4]} | #{board[5]} "
  puts "-----------"
  puts " #{board[6]} | #{board[7]} | #{board[8]} "
end

def input_to_index(input)
  input = input.to_i - 1
end

def move(board, index, current_player = "X")
  board[index] = current_player
end

def turn(board)
  puts "Please enter 1-9:"
  input = gets.strip
  index = input_to_index(input)
  if valid_move?(board, index)
    move(board, index)
    display_board(board)
  else
    turn(board)
  end
end

def valid_move?(board, index)
  if (board[index] == "X" || board[index] == "O") == false && index.between?(0, 8)
    true
  else
    false
  end
end

def position_taken?(board, location)
  board[location] != " " && board[location] != ""
end

def valid_move?(board, index)
  index.between?(0,8) && !position_taken?(board, index)
end

def play(board)
  9.times do
    turn(board)
  end
end

def turn_count(board)
  board_index = 0
  turn_counter = 0
  while board_index < board.size
    if board[board_index] == "X" || board[board_index] == "O"
      turn_counter += 1
      board_index += 1
    else
      board_index += 1
    end
  end
  turn_counter
end

def current_player(board)
  turn_count(board).even? ? "X" : "O"
end

win = nil

def won?(board)
  false if board.each == " " || board.each == "" || board.each == nil
  check_win = false
  i = 0
  counter = 0
  array = []
  while i < WIN_COMBINATIONS.size
    array = WIN_COMBINATIONS[i]
    array.each do |idx|
      if board[idx] == "O"
        counter += 1
      end
    end
    if counter == 3
      check_win = true
      break
    else
      counter = 0
      i += 1
    end
  end
  if check_win
    win = "O"
    array
  else
    counter = 0
    i = 0
    while i < WIN_COMBINATIONS.size
      array = WIN_COMBINATIONS[i]
      array.each do |idx|
        if board[idx] == "X"
          counter += 1
        end
      end
      if counter == 3
        check_win = true
        break
      else
        counter = 0
        i += 1
      end
    end
    if check_win
      win = "X"
      array
    else
      false
    end
  end
end

def full?(board)
  board.all? do |idx|
    idx == "X" || idx == "O"
  end
end

def draw?(board)
  if won?(board)
    false
  elsif !won?(board) && full?(board)
    true
  end
end

def over?(board)
  if won?(board)
    true
  elsif draw?(board)
    true
  elsif full?(board)
    true
  else
    false
  end
end

def winner(board)
  false if board.each == " " || board.each == "" || board.each == nil
  check_win = false
  i = 0
  counter = 0
  array = []
  while i < WIN_COMBINATIONS.size
    array = WIN_COMBINATIONS[i]
    array.each do |idx|
      if board[idx] == "O"
        counter += 1
      end
    end
    if counter == 3
      check_win = true
      break
    else
      counter = 0
      i += 1
    end
  end
  if check_win
    "O"
  else
    counter = 0
    i = 0
    while i < WIN_COMBINATIONS.size
      array = WIN_COMBINATIONS[i]
      array.each do |idx|
        if board[idx] == "X"
          counter += 1
        end
      end
      if counter == 3
        check_win = true
        break
      else
        counter = 0
        i += 1
      end
    end
    if check_win
      "X"
    else
      nil
    end
  end
end
