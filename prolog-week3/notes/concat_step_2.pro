% handle an empty list
concatenate([], List, List).
% handle non empty list
concatenate([Head|[]], List, [Head|List]).
