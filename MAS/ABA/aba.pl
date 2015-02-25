:- use_module(library(aggregate)).
    
argument((Arg, [Arg])):-
    \+ hasRule(Arg),
    myAsm(Arg).

argument((Arg, Support)):-
    hasRule(Arg),
    member(Support, Supports),
    findall(Ss, myRule(Arg, Ss), Supports),
    forall(member(SL, Supports),
	    (SL = [];
	     (member(S, SL),
	      myAsm(S);
	      argument((S,_))))).

argument((Arg,[])):-
    myRule(Arg, []).

hasRule(Arg):-
    myRule(Arg, _).

attacks((C1, X1), (C2, X2)):-
    contrary(C1, Assum);
    contrary(Assum, C1),
    member(Assum, X2),
    argument((C1, X1)),
    argument((C2, X2)).
    
