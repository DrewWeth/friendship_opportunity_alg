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
      # puts node.to_s + ", " + temp_node.to_s
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

def display_conn(arg)
  size = arg[0].to_i
  conn = init(size)
  conn = set_conns(conn)
  puts conn.inspect
  puts conn.flatten.length
end

def eff_display_conn(arg)
  total = 0
  count = arg[0].to_i - 1
  count.times do
    total += count
    count -= 1
  end
  puts total
end

# display_conn(ARGV[0].to_i)
# eff_display_conn()
# display_conns(3)



def time_method(method, *args)
  beginning_time = Time.now
  self.send(method, args)
  end_time = Time.now
  # puts "Time elapsed #{(end_time - beginning_time)*1000} milliseconds"
  return (end_time - beginning_time)*1000
end



times = []

times << time_method(:display_conn, ARGV[0])
times << time_method(:eff_display_conn, ARGV[0])
# times << time_method(:pyramid_display_conn, ARGV[0])

puts times.inspect
puts (times[0]/times[1]).round.to_s + "% increase in efficiency"
