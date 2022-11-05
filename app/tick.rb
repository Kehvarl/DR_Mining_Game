def init args
  args.state.game_map = Game_Map.new()
end

def tick args
  if args.state.tick_count == 0
    init args
  end
  args.outputs.primitives << args.state.game_map.render

  if rand(100) <= 20
    args.state.game_map.tiles[rand(args.state.game_map.h)][rand(args.state.game_map.w)] = nil
  end
end