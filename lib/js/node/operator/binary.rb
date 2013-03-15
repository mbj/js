module JS
  class Node
    class Operator
      # Base class for binary operators
      class Binary < self
        include Concord.new(:left, :right)

      private

        # Emit node
        #
        # @return [undefined]
        #
        # @api private
        #
        def emit(buffer)
          buffer.binary(left, operator, right)
        end

        # Binary weak equality operator
        class WeakEquality < self
          SYMBOL = :==
        end

        # Binary inequality operator
        class WeakInequality < self
          SYMBOL = :'!=='
        end

        # Binary equality operator
        class Equality < self
          SYMBOL = :===
        end

        # Binary weak inequality operator
        class Inequality < self
          SYMBOL = :'!=='
        end

        # Binary or operator
        class Or < self
          SYMBOL = :'||'
        end

        # Binary and operator
        class And < self
          SYMBOL = :'&&'
        end

        # Binary in operator
        class In < self
          SYMBOL = :'IN'
        end

        # Binary less than operator
        class LessThan < self
          SYMBOL = :'<'
        end

        # Binary less than or equal to operator
        class LessThanOrEqualTo < self
          SYMBOL = :'<='
        end

        # Binary greater than operator
        class GreaterThan < self
          SYMBOL = :'>'
        end

        # Binary greater than or equal to operator
        class GreaterThanOrEqualTo < self
          SYMBOL = :'>='
        end

        # Binary addition operator
        class Addition < self
          SYMBOL = :+
        end

        # Binary subtraction operator
        class Subtraction < self
          SYMBOL = :-
        end

        # Binary multiplication operator
        class Multiplication < self
          SYMBOL = :*
        end

        # Binary division operator
        class Division < self
          SYMBOL = :/
        end

        # Binary modulo operator
        class Modulo < self
          SYMBOL = :%
        end

        # Assignment operator
        class Assignment < self
          SYMBOL = :'='
        end

        # Modulus assignment operator
        class ModulusAssignment < self
          SYMBOL = :'%='
        end

        # Subtraction assignment operator
        class AdditionAssignment < self
          SYMBOL = :'+='
        end

        # Division assignment operator
        class DivisionAssignment < self
          SYMBOL = :'/='
        end

        # Multiplication assignment operator
        class MultiplicationAssignment < self
          SYMBOL = :'*='
        end

      end
    end
  end
end
