:- [aba].

myAsm(a).
myAsm(b).
contrary(a, p).
myRule(p, [b]).
myRule(p,[]).

test(success):-
    argument((p, [b])),
    argument((p, [])),
    argument((b, [b])),
    argument((a, [a])),
    attacks((p, [b]), (a, [a])),
    attacks((p, []), (a, [a])).
    
