require 'formatize/helpers'

ActiveSupport.on_load(:action_view) do
  include Formatize::Helpers
end