require 'formatize/helper'

ActiveSupport.on_load(:action_view) do
  include Formatize::Helper
end

