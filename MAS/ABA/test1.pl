:- [grounded].

argument(a).
argument(b).
argument(c).
argument(d).

attacks(a,a).
attacks(a,b).
attacks(b,a).
attacks(c,d).
attacks(d,c).

test(sucess):-
    \+ grounded(a),
    \+ grounded(b),
    \+ grounded(c),
    \+ grounded(d).
