:- use_module(library(aggregate)).
:- use_module(library(lists)).

argument((Arg, [Arg])):-
    myAsm(Arg).

argument((Arg, Res)):-
    myRule(Arg, Support),
    findall(Ss, (member(S, Support), argument((S, Ss))), Supports),
    flatten(Supports, Res).

attacks((C1, X1), (C2, X2)):-
    argument((C1, X1)),
    argument((C2, X2)),
    member(Assum, X2),
    contrary(Assum, C1).

flatten(List, Flat) :-
        flatten(List, Flat, []).

flatten([], Res, Res) :- !.
flatten([Head|Tail], Res, Cont) :-
        !,
        flatten(Head, Res, Cont1),
        flatten(Tail, Cont1, Cont).
flatten(Term, [Term|Cont], Cont).
    
    
