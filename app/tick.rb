def init args
  args.state.game_map = Game_Map.new()
end

def tick args
  if args.state.tick_count == 0
    init args
  end
  args.outputs.primitives << args.state.game_map.render

  if rand(100) <= 20
    x = rand(args.state.game_map.h)
    y = rand(args.state.game_map.w)
    v = args.state.game_map.tiles[x][y].visible
    if v then
      args.state.game_map.tiles[x][y].dig
    else
      args.state.game_map.tiles[x][y].set_visible
    end
  end
end