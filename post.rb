class Stack
	class UnderFlowError < StandardError;end
	
	def initialize
	@stack = []
	end
	
	def empty?
	@stack.empty?
	end
	
	def push(val)
	@stack.push(val)
	end
	
	def pop
	raise UnderFlowError, "Stack is empty" if empty?
	@stack.pop
	end
	
	def peek
	@stack.last
	end
	end
	
	class RPNExpression
	def initialize(expr)
	@expr = expr
	end
	
	def evaluate
	stack = Stack.new
	
	tokens.each do |token|
	case
	when numeric?(token)
	stack.push(token.to_f) # Casting to a float instead of integer
	when token.match(/^[\+\-\*]$/) # Just check for an operator
	rhs = stack.pop
	lhs = stack.pop
	stack.push(lhs.send(token, rhs))
	else
	raise "whaaaat I don't know this token? #{token}"
	end
	end
	
	stack.pop
	end
	
	private
	
	def tokens
	@expr.split(" ")
	end
	
	def numeric?(token)
	Float(token) rescue false
	end
	end
	
	puts RPNExpression.new("4 7 3 + 8 * 16.2 + *").evaluate
