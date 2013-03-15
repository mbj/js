module JS
  class Node
    class Literal
      class Composed
        # Literal list node
        class Array < self
          handle(::Array)

        private

          # Emit node
          #
          # @param [Buffer] buffer
          #
          # @return [undefined]
          #
          # @api private
          #
          def emit(buffer)
            buffer.wrap_delimited('[', body, ']')
          end

          # Construct object
          #
          # @param [#each] object
          #
          # @return [Node::Literal::Array]
          #
          # @api private
          #
          def self.construct(object)
            body = object.map do |item|
              Literal.build(item)
            end
            new(body)
          end

        end
      end
    end
  end
end
