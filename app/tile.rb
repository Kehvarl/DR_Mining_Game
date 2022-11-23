class Tile < Sprite
  attr_accessor :explored, :visible, :visible_path, :blocks_sight, :blocks_movement, :mined_path, :hardness, :hp

  def initialize(args)
    super
    self.w = args.w || 40
    self.h = args.h || 40
    self.x = args.x * self.w
    self.y = args.y * self.h
    self.path = args.path || 'sprites/tile/fog-001.png'
    self.visible_path = args.visible_path || 'sprites/tile/wall-1111.png'
    self.mined_path = args.mined_path || 'sprites/tile/wall-0000.png'
    self.visible = args.visible || false
    self.explored = args.explored || false
    self.blocks_sight = args.blocks_sight || true
    self.blocks_movement = args.blocks_movement || true
    self.hardness = args.hardness || 0
    self.hp = args.hp || 10
  end

  def set_visible
    self.visible = true
    self.path =  self.visible_path
  end

  def dig(damage)
    d = damage - self.hardness
    if d > 0
      self.hp -= d
    end
    if self.hp <= 0
      self.blocks_sight = false
      self.blocks_movement = false
      self.path =  self.mined_path
    end
  end
end

#A Tile is a space on the Game Map
#   Can be empty or filled
#   If filled has a hardness, HP, and possible resource values
#   Digging is reduced by hardness and reduces HP
#   When Tile HP reaches 0, digging entity gains tile resources
#   If digger can't hold things, resources are dropped on the tile
