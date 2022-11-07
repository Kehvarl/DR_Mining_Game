class Tile < Sprite
  attr_accessor :visible, :visible_path, :blocks_sight, :blocks_movement, :mined_path

  def initialize args
    super
    self.w = args.w || 40
    self.h = args.h || 40
    self.x = args.x * self.w
    self.y = args.y * self.h
    self.path = args.path || 'sprites/tile/fog-001.png'
    self.visible_path = args.visible_path || 'sprites/tile/wall-0000.png'
    self.mined_path = args.mined_path || 'sprites/tile/wall-1111.png'
    self.visible = args.visible || false
    self.blocks_sight = args.blocks_sight || true
    self.blocks_movement = args.blocks_movement || true
  end

  def set_visible
    self.visible = true
    self.path =  self.visible_path
  end

  def dig
    self.blocks_sight = false
    self.blocks_movement = false
    self.path =  self.mined_path
  end
end

