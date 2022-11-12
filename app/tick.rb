# Tick.RB
# Contains the `tick` routine which will be called every frame by DragonRuby
# Must be last included file in Main.RB

def init(args)
  args.state.game_map = Game_Map.new
  args.state.current_x, args.state.current_y = args.state.game_map.random_tile

  args.state.game_map.clear(args.state.current_x, args.state.current_y)

  args.state.viewport = Viewport.new(args.state.game_map)
  args.state.viewport.center_on(args.state.current_x, args.state.current_y)

  args.state.minimap = Minimap.new(args.state.game_map)

  args.state.game_map.highlight(args.state.current_x, args.state.current_y)

end

def tick_render(args)
  args.state.game_map.render(args)

  args.state.viewport.render(args)

  args.state.minimap.render(args)
end

def tick(args)
  if args.state.tick_count == 0
    init args
  end

  tick_render args

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