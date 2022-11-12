class Viewport
  attr_accessor :x, :y, :w, :h, :display_x, :display_y, :display_w, :display_h, :max_pos_x, :max_pos_y, :game_map, :center_x, :center_y

  def initialize(game_map)
    self.w = 1280
    self.h = 720
    self.display_w = 640
    self.display_h = 360
    self.display_x = 0
    self.display_y = 0
    self.max_pos_x = game_map.screen_width - self.w
    self.max_pos_y = game_map.screen_height - self.h
  end

  def move(args)
    self.x += args.dx || 0
    self.y += args.dy || 0
    self.validate_position
  end

  def center_on(center_x, center_y)
    self.x = center_x * 40 - 620
    self.y = center_y * 40 - 340
    self.validate_position
  end

  def validate_position
    if self.y >= self.max_pos_y
      self.y = self.max_pos_y
    elsif self.y < 0
      self.y = 0
    end

    if self.x >= self.max_pos_x
      self.x = self.max_pos_x
    elsif self.x < 0
      self.x = 0
    end
  end

  def render(args)
    args.outputs.primitives << {x: self.display_x, y: self .display_y,
                                w: self.display_w, h: self.display_h,
                                path: :game_map,
                                source_x: self.x, source_y: self.y,
                                source_w: self.w, source_h: self.h}.sprite!
  end
end
