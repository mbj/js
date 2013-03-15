module JS
  class Node
    class Literal
      # Singleton literal
      class Singleton < self
        include Concord.new(:token)

        handle(NilClass)
        handle(TrueClass)
        handle(FalseClass)

        private_class_method :new

        # Construct object
        #
        # @param [Object] object
        #
        # @return [Node::Literal::Singleton]
        #
        # @api private
        #
        def self.construct(object)
          MAPPING.fetch(object)
        end

      private

        # Emit node
        #
        # @return [undefined]
        #
        # @api private
        #
        def emit(buffer)
          buffer.append(token)
        end

        NULL      = new('null')
        FALSE     = new('false')
        TRUE      = new('true')
        UNDEFINED = new('undefined')
        INFINITY  = new('Infinity')
        NAN       = new('NaN')

        MAPPING = {
          nil             => NULL,
          false           => FALSE,
          true            => TRUE,
          Float::INFINITY => INFINITY,
          Float::NAN      => NAN
        }

      end
    end
  end
end
