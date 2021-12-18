parent('Hasib','Rakib').
parent('Rakib','Sohel').
parent('Rakib','Rebeka').
parent('Rashid','Hasib').
parent('Rashid','Kamal').
parent('Rakib','Jessica').
parent('Jessica','Joe').
%parent('Jaman','Rakib').
male('Hasib').
male('Rakib').
male('Sohel').
male('Rashid').
male('Jaman').
male('Kamal').
male('Joe').
female('Rebeka').
female('Jessica').


brother(X,Y):-
    parent(Z,X),parent(Z,Y),male(X),not(X=Y).

sister(X,Y):-
    parent(Z,X),parent(Z,Y),female(X),not(X=Y).

uncle(X,Y):-
    parent(Z,Y),brother(Z,X),male(X).

aunty(X,Y):-
    parent(Z,Y),sister(Z,X),female(X).


findBrother:-
    write('Brother of: '),
    read(B),
    write('Brother: '),
    brother(X, B),
    write(X),
    tab(5),
    fail.
findBrother.

findSister:-
    write('Brother of: '),
    read(S),
    write('Brother: '),
    sister(X, S),
    write(X),
    tab(5),
    fail.
findSister.

findUncle:-
    write('Uncle of: '),
    read(U),
    write('Uncle: '),
    uncle(X, U),
    write(X),
    tab(5),
    fail.
findUncle.

findAunty:-
    write('Aunty of: '),
    read(A),
    write('Aunty: '),
    aunty(X, A),
    write(X),
    tab(5),
    fail.
findAunty.
