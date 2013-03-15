require 'backports'
require 'ice_nine'
require 'abstract_type'
require 'adamantium'
require 'concord'

# Library namespace
module JS
  KEYWORDS = IceNine.deep_freeze(%w(
    break case catch continue default 
    delete do else finally for function 
    if in instanceof new return switch 
    this throw try typeof var void while
    with
  ).to_set)

  # Return AQL node for literal
  #
  # @param [Object] value
  #
  # @return [AQL::Node::Literal]
  #
  # @api private
  #
  def self.literal_node(value)
    Node::Literal.build(value)
  end

  # Return AQL name node
  #
  # @param [#to_s] name
  #
  # @return [AQL::Node::Name]
  #
  # @api private
  #
  def self.name_node(name)
    Node::Name.new(name.to_s)
  end
end

require 'js/buffer'
require 'js/node'
require 'js/node/name'
require 'js/node/literal'
require 'js/node/literal/primitive'
require 'js/node/literal/primitive/string'
require 'js/node/literal/primitive/number'
require 'js/node/literal/composed'
require 'js/node/literal/composed/document'
require 'js/node/literal/composed/array'
require 'js/node/literal/singleton'
require 'js/node/operator'
require 'js/node/operator/binary'
require 'js/node/operator/unary'
require 'js/node/operator/ternary'
require 'js/node/operator/nary'
require 'js/node/if'
require 'js/node/while'
