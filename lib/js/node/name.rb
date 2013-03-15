module JS
  class Node
    # Generic JS identifier
    class Name < self
      include Concord.new(:name)

    private

      # Emit node
      #
      # @param [Buffer] buffer
      #
      # @return [undefined]
      #
      def emit(buffer)
        buffer.append(name)
      end

    end
  end
end
