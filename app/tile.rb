class Tile < Sprite
  def initialize (x, y)
    super
    self.x = x*10
    self.y = y*10
    self.w = 10
    self.h = 10
    self.path = 'sprites/tile/wall-1111.png'
    #self.r = 128
    #self.g = 128
    #self.b = 129
    #self.a = 255
  end
end

