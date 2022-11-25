* Map
  * Collection of tiles
  * Collection of entities
  * Field Of View
    * Visible areas
    * Explores areas
    # Game Map
    # Tracks Tiles
    # Tracks Entity Locations
    # Tracks Explored Areas
    #   Might move this to Entity
    # Tracks Lit Areas
    #   Might move this to Entity

* Viewport
  * Render subset of map
* Entity
  * Position
  * Sprite
  * Blocks Movement?
  * Blocks Sight?
  * Components
    * Combat
      * HP
      * Attack
      * Defense
    * AI
      * Movement Rules
      * Attack Rules
    * Equipment
    * Container
* Tile
#A Tile is a space on the Game Map
#   Can be empty or filled
#   If filled has a hardness, HP, and possible resource values
#   Digging is reduced by hardness and reduces HP
#   When Tile HP reaches 0, digging entity gains tile resources
#   If digger can't hold things, resources are dropped on the tile
  * Sprite
  * Blocks Movement?
  * Blocks Sight?
  * Hardness
  * HP
  * Resources
