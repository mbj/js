module JS
  # Abstract base class for JS nodes
  class Node
    include Adamantium, AbstractType

    # Return source representation
    #
    # @return [String]
    #
    # @api private
    #
    def javascript
      emitter = Buffer.new
      emit(emitter)
      emitter.content
    end
    memoize :javascript

    # Visit node
    #
    # @param [Buffer] buffer
    #
    # @return [self]
    #
    # @api private
    #
    def visit(buffer)
      emit(buffer)
      self
    end

  private

    # Emit JS
    #
    # @param [Emitter] emitter
    #
    # @return [undefined]
    #
    # @api private
    #
    abstract_method :emit

  end
end
