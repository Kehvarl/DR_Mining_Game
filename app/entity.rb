class Entity < Sprite
  attr_accessor :x, :y

  def initialize(args)
    super
    self.w = args.w || 40
    self.h = args.h || 40
    self.x = args.x * self.w
    self.y = args.y * self.h
    self.path = args.path || 'sprites/circle/red.png'
  end
end
