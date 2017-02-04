class Node # node of a linked list
	attr_accessor :value, :next_node

	def initialize(value)
		@value = value
		@next_node = nil
	end
end

class LinkedList
	attr_reader :head, :tail, :size

	def initialize
		@head = nil
		@tail = nil
		@size = 0
	end

	def append(value)
		new_node = Node.new(value)
		if @head.nil? 
			#If the list is empty, set the head equal to the node
			#Later set the tail equal to the node as well
			#They both are the same node, not two separate nodes
			@head = new_node
		else
			#
			@tail.next_node = new_node
		end
		@tail = new_node
		@size += 1
	end

	def prepend(value)
		new_node = Node.new(value)
		if @head.nil?
			@head = new_node
			@tail = new_node
		else
			new_node.next_node = @head
			@head = new_node
		end
		@size += 1
	end

	def at(index)
		node_at_index = @head
		index.times do |x|
			node_at_index = node_at_index.next_node
		end
		node_at_index
	end

	def pop
		@tail = at(@size-2)
		tail.next_node = nil
		@size -= 1
	end

	def contains?(value)
		@size.times do |index|
			return true if at(index).value == value
		end
		false
	end

	def find(value)
		@size.times do |index|
			return index if at(index).value == value
		end
		nil
	end

	def to_s
		output_string = ""
		@size.times do |index|
			output_string = output_string + "( #{at(index).value} ) -> "
		end
		output_string = output_string + "nil"
	end
end

my_list = LinkedList.new
puts my_list.to_s
puts "Appending 5"
my_list.append(5)
puts my_list.to_s

puts "Appending 10"
my_list.append(10)
puts my_list.to_s

puts "Appending 15"
my_list.append(15)
puts my_list.to_s

puts "Prepending 0"
my_list.prepend(0)
puts my_list.to_s

puts "Size: #{my_list.size}"
puts "At(2): #{my_list.at(2).value}"
puts "Popping!"
my_list.pop
puts my_list.to_s
puts "Size: #{my_list.size}"

puts "Contains? 5: #{my_list.contains? 5}"
puts "Contains? 13: #{my_list.contains? 13}"
puts "Find(5): #{my_list.find(5)}"
puts "Find(13): #{my_list.find(13)}"
puts my_list.to_s





