:- [grounded].

argument(a).
argument(b).
argument(c).
argument(d).
argument(e).

attacks(a,b).
attacks(c,b).
attacks(b,d).
attacks(d,e).
attacks(e,d).

test(sucess):-
    grounded(a),
    \+ grounded(b),
    grounded(c),
    \+ grounded(d),
    \+ grounded(e).
