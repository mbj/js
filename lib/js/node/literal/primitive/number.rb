module JS
  class Node
    class Literal
      class Primitive
        # Literal number node
        class Number < self
          handle(Float)
          handle(Fixnum)

        private

          # Emit JS
          #
          # @param [Buffer] buffer
          #
          # @return [undefined]
          #
          # @api private
          #
          def emit(buffer)
            buffer.append(value.to_s)
          end

        end
      end
    end
  end
end
