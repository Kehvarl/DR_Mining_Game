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

  def handle_keys(args)
    if args.inputs.keyboard.h
      self.x -= 40
    elsif args.inputs.keyboard.l
      self.x += 40
    elsif args.inputs.keyboard.k
      self.y += 40
    elsif args.inputs.keyboard.j
      self.y -= 40
    end
    self.check_limits
  end

  def check_limits
    if self.x < 0
      self.x = 0
    elsif self.x > 2520
      self.x = 2520
    end
    if self.y < 0
      self.y = 0
    elsif self.y > 1400
      self.y = 1400
    end
  end
end
