module JS
  class Node
    # If statmement
    class If < self
      include Concord.new(:condition, :if_branch, :else_branch)

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
        buffer.append('if ')
        emit_condition(buffer)
        emit_if_branch(buffer)
        emit_else_branch(buffer) if else_branch
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

      # Emit if branch
      #
      # @param [Buffer] buffer
      #
      # @return [undefined]
      #
      # @api private
      #
      def emit_if_branch(buffer)
        buffer.parentheses(' { ', ' }') do
          if_branch.visit(buffer)
        end
      end

      # Emit else branch
      #
      # @param [Buffer] buffer
      #
      # @return [undefined]
      #
      # @api private
      #
      def emit_else_branch(buffer)
        buffer.parentheses(' else { ', ' }') do
          else_branch.visit(buffer)
        end
      end

    end
  end
end
