# Tick.RB
# Contains the `tick` routine which will be called every frame by DragonRuby
# Must be last included file in Main.RB

def init(args)
  args.state.game_map = Game_Map.new
  args.state.current_x, args.state.current_y = args.state.game_map.random_tile

  args.state.game_map.clear(args.state.current_x, args.state.current_y)

  args.state.viewport_x = (args.state.current_x * 40) - 620
  if args.state.viewport_x >= 1280
    args.state.viewport_x = 1280
  elsif args.state.viewport_x < 0
    args.state.viewport_x = 0
  end
  args.state.viewport_y = (args.state.current_y * 40) - 340
  if args.state.viewport_y >= 720
    args.state.viewport_y = 720
  elsif args.state.viewport_y < 0
    args.state.viewport_y  = 0
  end

end

def tick(args)
  if args.state.tick_count == 0
    init args
  end
  args.state.game_map.render(args)

  args.state.game_map.highlight(args.state.current_x, args.state.current_y)

  args.outputs.primitives << {x: 0, y: 0, w: 1280, h: 720,
                             path: :game_map,
                             source_x: args.state.viewport_x, source_y: args.state.viewport_y,
                             source_w: 1280, source_h: 720}.sprite!


  if args.inputs.keyboard.right
    args.state.viewport_x += 20
    if args.state.viewport_x >= 1280
      args.state.viewport_x = 1280
    end
  elsif args.inputs.keyboard.left
    args.state.viewport_x -= 20
    if args.state.viewport_x <= 0
      args.state.viewport_x = 0
    end
  elsif args.inputs.keyboard.up
    args.state.viewport_y += 20
    if args.state.viewport_y > 720
      args.state.viewport_y = 720
    end
  elsif args.inputs.keyboard.down
    args.state.viewport_y -= 20
    if args.state.viewport_y <= 0
      args.state.viewport_y = 0
    end
  end

  if rand(100) < 0
    x = rand(args.state.game_map.h)
    y = rand(args.state.game_map.w)
    v = args.state.game_map.tiles[x][y].visible
    if v
      args.state.game_map.tiles[x][y].dig
    else
      args.state.game_map.tiles[x][y].set_visible
    end
  end
end