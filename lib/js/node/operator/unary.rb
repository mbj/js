module JS
  class Node
    class Operator
      # Base class for unary operators
      class Unary < self
        include Concord.new(:target)

      private

        # Base class for unary prefix operators
        class Prefix < self

        private

          # Emit node
          #
          # @return [undefined]
          #
          # @api private
          #
          def emit(buffer)
            buffer.append(operator)
            target.visit(buffer)
          end

          # Unary negation operator
          class Negation < self
            SYMBOL = :'!'
          end

          # Unary plus operator
          class Plus < self
            SYMBOL = :+
          end

          # Unary minus operator
          class Minus < self
            SYMBOL = :-
          end

          # Unary prefix increment operator
          class Increment < self
            SYMBOL = :'++'
          end

          # Unary prefix decremement operator
          class Decrement < self
            SYMBOL = :'--'
          end

        end

        # Base class for unary postfix operators
        class Postfix < self

        private

          # Emit node
          #
          # @return [undefined]
          #
          # @api private
          #
          def emit(buffer)
            target.visit(buffer)
            buffer.append(operator)
          end

          # Unary postfix increment operator
          class Increment < self
            SYMBOL = :'++'
          end

          # Unary postfix decremement operator
          class Decrement < self
            SYMBOL = :'--'
          end

        end
      end
    end
  end
end
