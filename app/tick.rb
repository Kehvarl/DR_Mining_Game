# Tick.RB
# Contains the `tick` routine which will be called every frame by DragonRuby
# Must be last included file in Main.RB

def init(args)
  args.state.game_map = Game_Map.new
  args.state.current_x, args.state.current_y = args.state.game_map.random_tile

  args.state.game_map.clear(args.state.current_x, args.state.current_y)

  args.state.viewport = Viewport.new(args.state.game_map)
  args.state.viewport.center_on(args.state.current_x, args.state.current_y)
  args.state.viewport.display_w = 1280
  args.state.viewport.display_h = 720

  args.state.minimap = Viewport.new(args.state.game_map)
  args.state.minimap.w = args.state.game_map.screen_width
  args.state.minimap.h = args.state.game_map.screen_height
  args.state.minimap.display_y = 480
  args.state.minimap.display_w = 540
  args.state.minimap.display_h = 144

  args.state.game_map.entities << Entity.new(x:args.state.current_x, y:args.state.current_y)

end

def tick_render(args)
  args.state.game_map.render(args)

  args.state.viewport.render(args)

  # args.state.minimap.render(args)
end

def tick(args)
  if args.state.tick_count == 0
    init args
  end

  tick_render args

  args.state.game_map.entities.each do |e|
    e.handle_keys(args)
  end

  if args.inputs.keyboard.right
    args.state.viewport.move({dx:20})
  elsif args.inputs.keyboard.left
    args.state.viewport.move({dx:-20})
  elsif args.inputs.keyboard.up
    args.state.viewport.move({dy:20})
  elsif args.inputs.keyboard.down
    args.state.viewport.move({dy:-20})
  end

  if rand(100) < 33
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
