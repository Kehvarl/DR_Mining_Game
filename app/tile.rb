class Tile < Sprite
  def initialize (x, y)
    super
    self.x = x*40
    self.y = y*40
    self.w = 40
    self.h = 40
    self.path = 'sprites/tile/fog-001.png'
    #self.r = 128
    #self.g = 128
    #self.b = 129
    #self.a = 255
  end
end

