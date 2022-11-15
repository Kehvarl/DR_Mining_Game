# Main.RB
# Primary file checked by Dragon Ruby
# Load all class and setup files first, and `Tick.RB` last.

# Load classes here
require 'app/primitives.rb'
require 'app/tile.rb'
require 'app/entity.rb'
require 'app/game_map.rb'
require 'app/viewport.rb'
require 'app/minimap.rb'

# Do this last so you know all your classes are loaded before the game starts
require 'app/tick.rb'