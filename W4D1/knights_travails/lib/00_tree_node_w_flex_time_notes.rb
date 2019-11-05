require "byebug"
class PolyTreeNode
    
    attr_reader :value, :parent, :children

    def initialize(val)
        @value = val
        @parent = nil
        @children = []
        @root_node
    end

    def parent=(node)
        #self is the child node in the context of this method
        #this method is the setter method for the @parent instance variable
        #1. Set @parent to new_parent for self
        #2. Remove self from old_parent's children array
        #3. Add self to new_parent's children array
        #debugger

        #must first remove from old_parent's children, BEFORE you set @parent
        #to new parent
        old_parent = self.parent 

        @parent = node    
        if !node.nil? && !node.children.include?(self)
            node.children << self
            old_parent.children.delete(self) if !old_parent.nil?
        end  
    end

    def add_child(child_node)
        child_node.parent = self
    end

    def remove_child(child_node)
        if child_node.parent.nil?
            raise "No parent" 
        else
            child_node.parent = nil
        end
    end

    def dfs(target_value)
        return self if self.value == target_value
        
        self.children.each do |child|
            #debugger
            result = child.dfs(target_value)
            return result unless result.nil? # need this check or we'll prematurely return nil
        end
        nil
    end

    def inspect
        p @value
    end

    def bfs(target_value)
        que = []
        que << self

        until que.empty?
            current_node = que.pop
            if current_node.value == target_value
                return current_node
            else
                current_node.children.each {|child| que.unshift(child)}
            end
        end
    end
end






#child
#parent

#   A
# B   C
#D E F G 

# node child = Node.new("child")
# node parent = Node.new("parent")
# child.parent = (parent_node)
# child.parent = nil
#node.add_child(child)