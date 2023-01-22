require 'matrix'

# Create the game board
$board_size = 8
board = Matrix.build($board_size, $board_size) { 0 }

# Define the possible moves for a knight
$moves = [[2, 1], [2, -1], [-2, 1], [-2, -1], [1, 2], [1, -2], [-1, 2], [-1, -2]].freeze

# Helper function to check if a move is valid (i.e. within the game board)
def is_valid_move(x, y)
    return x >= 0 && x < $board_size && y >= 0 && y < $board_size
end

# Breadth-First Search function to find the shortest path
def BFS(start, ending)
    queue = []
    queue << start
    visited = Matrix.build($board_size, $board_size) { 0 }
    parent = Matrix.build($board_size, $board_size) { [0, 0] }
    visited[start[0], start[1]] = 1

    while !queue.empty?
        curr = queue.shift
        if curr == ending
            return parent
        end
        $moves.each do |move|
            x, y = curr[0] + move[0], curr[1] + move[1]
            if is_valid_move(x, y) && visited[x, y] == 0
                visited[x, y] = 1
                parent[x, y] = curr
                queue << [x, y]
            end
        end
    end
    return nil
end

def knight_moves(current_pos, desired_pos)
  parent = BFS(current_pos, desired_pos)
  if parent != nil
    path = [desired_pos]
    while path.last != current_pos
        path << parent[path.last[0], path.last[1]]
    end
    puts "Shortest path: #{path.reverse}"
  else
    puts "No path found."
  end
end

knight_moves([0,0],[6,5])