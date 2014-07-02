-module(day3).
-export([loop/0]).

%% init() ->
%%   process_flag(trap_exit, true),
%%   receive
%%     new -> 
%%       io:format("kicking things off"),
%%       register(translation_monitor, spawn_link(fun loop/0)),
%%       translation_monitor ! new,
%%       init();
%%     {'EXIT', _, _} -> 
%%       io:format("monitor died, starting again"),
%%       translation_monitor ! new,
%%       init()
%%   end.

loop() ->
  process_flag(trap_exit, true),
  receive
    % we need to register that we want to listen to killed processes
    new ->
      io:format("creating and monitoring translation process, ~n"),
      register(translation_loop, spawn_link(fun translation_service:loop/0)),
      loop();
    {'EXIT', From, Reason} -> 
      io:format("service ~p died with reason ~p", [From, Reason]),
      io:format("Starting a new one"),
      self() ! new,
      loop()
  end.

% I ended up resorting to this to kill my process: 
% exit(whereis(translation_loop), ok).
