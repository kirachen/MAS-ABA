:- use_module(library(aggregate)).

grounded(Arg):-
    \+ attacks(_, Arg),
    argument(Arg).

grounded(Arg):-
    forall(attacks(Attacker, Arg), (attacks(Defender, Attacker), 
	    \+ Defender = Attacker,
	    \+ Defender = Arg,
	    \+ Attacker = Arg,
	   grounded(Defender))).
