:- [grounded].

argument(a).
argument(b).
argument(c).

attacks(a,b).
attacks(b,c).

test(sucess):-
    grounded(a),
    \+ grounded(b),
    grounded(c).
