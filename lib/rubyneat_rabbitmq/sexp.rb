=begin rdoc
= Convert sexp (presumably off the wire) back to Ruby code.
=end

module NEATMQ
  module Sexp
    def s(type, *children)
      Parser::AST::Node.new(type, children)
    end
    
    # Given the sexp string, conver it back
    # to the Abstract Syntax Tree (AST).
    def sexp_to_ast(sexp)
      eval sexp
    end
  end
end
