module JS
  class Node
    # While statmement
    class Function < self
      include Concord.new(:arguments, :body)

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
        buffer.append('function')
        emit_arguments(buffer)
        buffer.body(body)
      end

      # Emit arguments
      #
      # @param [Buffer] buffer
      #
      # @return [undefined]
      #
      # @api private
      #
      def emit_arguments(buffer)
        buffer.parentheses do
          buffer.delimited(arguments)
        end
      end
    end
  end
end
