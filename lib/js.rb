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
