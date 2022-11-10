class Viewport
  attr_accessor :x, :y, :w, :h, :game_map

  def initialize(game_map, center_x, center_y)
    super
    self.game_map = game_map
    self.x = center_x * 40 - 620
    self.y = center_y * 40 - 340

    self.validate_position
  end

  def move(args)
    self.x += args.dx || 0
    self.y += args.dy || 0
    self.validate_position
  end

  def validate_position
    if self.y >= 720
      self.y = 720
    elsif self.y < 0
      self.y = 0
    end

    if self.x >= 1280
      self.x = 1280
    elsif self.x < 0
      self.x = 0
    end
  end

  def render args
    self.game_map.render(args)

    self..game_map.highlight(args.state.current_x, args.state.current_y)

    args.outputs.primitives << {x: 0, y: 0, w: 1280, h: 720,
                                path: :game_map,
                                source_x: self.x, source_y: self.y,
                                source_w: 1280, source_h: 720}.sprite!
  end
end
