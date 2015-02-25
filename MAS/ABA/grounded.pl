:- use_module(library(aggregate)).
:- use_module(library(lists)).

argument(a).
argument(b).
argument(c).
argument(d).

attacks(a,a).
attacks(a,b).
attacks(b,a).
attacks(c,d).
attacks(d,c).

grounded(X):-
  process(_, _, Final),
  member(X, Final).
  
process(X, X, Final):-
  find_initial_grounded_items(Result),
  \+ length(Result, 0),
  findall(D, (member(R, Result), find_defendees(R, D)), DSet),
  flatten(DSet, DefenseSet),
  findall(D, (member(D, DefenseSet), isDefended(Result, D)), Res),
  append(Result, Res, Final).
  
process(PrevIteration, CurrentIteration, Final):-
  \+ PrevIteration = CurrentIteration,
  find_initial_grounded_items(Result),
  findall(D, (member(R, Result), find_defendees(R, D)), DSet),
  flatten(DSet, DefenseSet),
  findall(D, (member(D, DefenseSet), isDefended(Result, D)), Res),
  append(Result, Res, Rez),
  process(CurrentIteration, Rez, Final).
  
find_defendees(X, DSet):-
  find_attackees(X, Attackees),
  findall(D, (member(A, Attackees), find_attackees(A, D)), Set),
  flatten(Set, DSet).
 
  
find_attackees(X, Attackees):-
  findall(Attack, attacks(X, Attack), Attackees).
   
find_initial_grounded_items(Result):-
  findall(X, attacks(_, X), Res),
  findall(Y, argument(Y), Res2),
  subtract(Res2, Res, Result).
  
defends([], X):-
  \+ attacks(_, X).
  
defends(X, Y):-
  \+ (attacks(Z, Y),
      \+ attacks(X, Z)).

isDefended(Defenders, X):-
  findall(Attack, attacks(Attack, X), Attackers),
  \+ (member(A, Attackers),
      \+ (attacks(D, A), member(D, Defenders))).
      
flatten(List, Flat) :-
        flatten(List, Flat, []).

flatten([], Res, Res) :- !.
flatten([Head|Tail], Res, Cont) :-
        !,
        flatten(Head, Res, Cont1),
        flatten(Tail, Cont1, Cont).
flatten(Term, [Term|Cont], Cont).

subtract([], _, []).
subtract([Head|Tail], L2, L3):-
        memberchk(Head, L2),
        !,
        subtract(Tail, L2, L3).
        
subtract([Head|Tail1], L2, [Head|Tail3]):-
        subtract(Tail1, L2, Tail3).
