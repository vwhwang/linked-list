
# Defines a node in the singly linked list
class Node
  attr_reader :data # allow external entities to read value but not write
  attr_accessor :next # allow external entities to read or write next node
  attr_accessor :previous 

  def initialize(value, next_node = nil, previous = nil )
    @data = value
    @next = next_node
    @previous = previous
  end
end

# Defines the singly linked list
class LinkedList
    def initialize
      @head = nil # keep the head private. Not accessible outside this class
      @tail = nil 
    end

    # method to add a new node with the specific data value in the linked list
    # insert the new node at the beginning of the linked list
    # Time Complexity: O(1)
    # Space Complexity: O(1)
    def add_first(value)
      if @head.nil? 
        @head = @tail = Node.new(value)
      else
        new_node = Node.new(value,@head)
        @head.previous = new_node 
        @head = new_node  
      end 
    end

    # method to find if the linked list contains a node with specified value
    # returns true if found, false otherwise
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def search(value)
      return false if @head.nil? 
      pointer = @head 
 
      until pointer.next.nil?
       
        if pointer.data == value || pointer.next.data == value 
          return true 
        else  
          pointer = pointer.next 
        end 

      end 

      return false 
    end

    # method to return the max value in the linked list
    # returns the data value and not the node
    def find_max
      return nil if @head.nil? 
      max = @head.data
      pointer = @head

      while !pointer.nil?
        if pointer.data > max 
          max = pointer.data 
        end 
        pointer = pointer.next 
      end 
      return max 
    end

    # method to return the min value in the linked list
    # returns the data value and not the node
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_min
      return nil if @head.nil? 

      min = @head.data
   
      pointer = @head
      while !pointer.nil?
        if pointer.data < min
          min = pointer.data 
        end 
        pointer = pointer.next 
      end 
    
      return min 
    end


    # method that returns the length of the singly linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def length
      count = 1 
      return 0 if @head.nil? 
      pointer = @head
      until pointer.next.nil? 
        count += 1 
        pointer = pointer.next
      end 
      return count 
    end

    # method that returns the value at a given index in the linked list
    # index count starts at 0
    # returns nil if there are fewer nodes in the linked list than the index value
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def get_at_index(index)
      node_index = 0 
      pointer = @head 
      until pointer.nil? 
       if node_index == index 
        return pointer.data 
       else 
        node_index += 1 
       end 
       pointer = pointer.next 
      end 
  
      return nil 
    end

    # method to print all the values in the linked list
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def visit
      pointer = @head 
      while !pointer.nil? 
        puts pointer.data 
        pointer = pointer.next 
      end 
    end

    # method to delete the first node found with specified value
    # Time Complexity: O(n)
    # Space Complexity: O(n)
 
    def delete(value)
      return nil if @head.nil? 
      pointer = @head 


      while !pointer.nil? 
       if pointer.data == value 
        if pointer == @head 
          @head = pointer.next 
        end 

        if pointer == @tail
          @tail = pointer.previous
        end 

        if !pointer.next.nil?
          pointer.next.previous = pointer.previous
        end 
        
        if !pointer.previous.nil?
          pointer.previous.next = pointer.next 
        end 
        return
       end 

       pointer = pointer.next
      end 
      
    end

    # method to reverse the singly linked list
    # note: the nodes should be moved and not just the values in the nodes
    # Time Complexity: ?
    # Space Complexity: ?
    def reverse
      pointer = @head 

      while !pointer.nil?
        temp = pointer.previous
        pointer.previous = pointer.next 
        pointer.next = temp 
        pointer = pointer.previous
      end 
        temp = @head
        @head = @tail
        @tail = temp
    end


    ## Advanced Exercises
    # returns the value at the middle element in the singly linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def find_middle_value
      raise NotImplementedError
    end

    # find the nth node from the end and return its value
    # assume indexing starts at 0 while counting to n
    # Time Complexity: O(n)
    # Space Complexity: O(1)
    def find_nth_from_end(n)
      node_index = 0
      pointer = @tail 

      until pointer == @head 
       if node_index == n 
        return pointer.data 
       else 
        node_index += 1 
       end 
       pointer = pointer.previous 
      end 

      if pointer == @head && (node_index  == n )
        return @head.data
      end 
  
      return nil 
    end

    # checks if the linked list has a cycle. A cycle exists if any node in the
    # linked list links to a node already visited.
    # returns true if a cycle is found, false otherwise.
    # Time Complexity: ?
    # Space Complexity: ?
    def has_cycle
      raise NotImplementedError
    end


    # Additional Exercises 
    # returns the value in the first node
    # returns nil if the list is empty
    # Time Complexity: ?
    # Space Complexity: ?
    def get_first
      return nil if @head.nil? 
      return @head.data 
    end

    # method that inserts a given value as a new last node in the linked list
    # Time Complexity: ?
    # Space Complexity: ?
    def add_last(value)
      
      temp = Node.new(value)
      if @head.nil?
        @head = @tail = temp
        return 
      end 

      current = @head 
      until current.next.nil? 
        current = current.next 
      end 

      current.next = temp
      temp.previous = current
      @tail = temp
    end

    # method that returns the value of the last node in the linked list
    # returns nil if the linked list is empty
    # Time Complexity: ?
    # Space Complexity: ?
    def get_last
      
      current = @head 

      until current.next.nil?
        current = current.next
      end 

      return current.data
    end

    # method to insert a new node with specific data value, assuming the linked
    # list is sorted in ascending order
    # Time Complexity: ?
    # Space Complexity: ?
    def insert_ascending(value)
      raise NotImplementedError
    end

    # Helper method for tests
    # Creates a cycle in the linked list for testing purposes
    # Assumes the linked list has at least one node
    def create_cycle
      return if @head == nil # don't do anything if the linked list is empty

      # navigate to last node
      current = @head
      while current.next != nil
          current = current.next
      end

      current.next = @head # make the last node link to first node
    end
end
