# USAGE "ruby graph.rb NUMBER_OF_NODES"

# USAGE EXAMPLE ruby graph.rb 5
# This finds the max number of friendships made between 5 different people

def init(size)
  conn = []
  size.times do
    conn << []
  end
  return conn
end

def set_conns(conn)
  node = 0

  conn.length.times do
    temp_node = 0
    conn.length.times do
      puts node.to_s + ", " + temp_node.to_s
      if node != temp_node and !conn[temp_node].include?(node)
        conn[node] << temp_node
      end

      temp_node += 1
    end
    node += 1
  end

  return conn
end

def display_conns(size)
  count = 0
  size.times do
    conn = init(count)

    puts set_conns(conn).flatten.length

    count += 1
  end
end

def display_conn(size)
  conn = init(size)
  conn = set_conns(conn)
  puts conn.inspect
  puts conn.flatten.length
end

display_conn(ARGV[0].to_i)

# display_conns(3)
