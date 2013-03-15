module JS
  class Node
    # While statmement
    class While < self
      include Concord.new(:condition, :body)

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
        buffer.append('while ')
        emit_condition(buffer)
        emit_body(buffer)
      end

      # Emit condition
      #
      # @param [Buffer] buffer
      #
      # @return [undefined]
      #
      # @api private
      #
      def emit_condition(buffer)
        buffer.parentheses do
          condition.visit(buffer)
        end
      end

      # Emit body
      #
      # @param [Buffer] buffer
      #
      # @return [undefined]
      #
      # @api private
      #
      def emit_body(buffer)
        buffer.parentheses(' { ', ' }') do
          body.visit(buffer)
        end
      end
    end
  end
end
