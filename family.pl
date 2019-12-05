
parent(frank, willem).
parent(frank, ina).

parent(vincent, carlos).
parent(vincent, anita).

parent(ina, jan_1).
parent(ina, vera).

parent(willem, cor).
parent(willem, annie).

parent(ina_2, cor).
parent(ina_2, annie).

parent(jennie, cor).
parent(jennie, annie).

parent(jan_2, jan_1).
parent(jan_2, vera).

parent(dick, jan_1).
parent(dick, vera).

parent(kees, jan_1).
parent(kees, vera).

parent(mathijs, jan_2).
parent(mathijs, liesbeth).

parent(eva, jan_2).
parent(eva, liesbeth).


parents(X, Y):-
    findall(Z, parent(X, Z), Y).

siblings(X, Y):- parent(X, Z),
    findall(INPUT, parent(INPUT, Z), [_|Y]).

grandparents(X, Z1, Z2):-
    parent(X,Y1),
    parent(Y1,Z1),
    parent(X,Y2),
    parent(Y2,Z2),
    Z1\=Z2.

grandparent(X, Z):-
    parent(X,Y),
    parent(Y,Z).

ancestor(X, Y):-
    parent(X, Y).

ancestor(X, Y):-
    parent(X, Z),
    ancestor(Z, Y).

%Gaat recusief naar boven door de familieboom
ancestors(X, Z):-
    findall(Y,ancestor(X,Y),Z).

offspring(X, Y):-
    parent(Y, X).

children(X, Y):-
    findall(INPUT, parent(INPUT, X), Y).

%offspring(X, Y):-
%    parent(Y, Z) ,
%    offspring(X, Z).

offspring_full(X, Z):-
    findall(Y,offspring(X,Y),Z).

spouse(X, Y):-
    parent(C, X),
    findall(Z, parent(C, Z), [_|Y]).

get_parents_siblings([], Result, Z):- Result = Z.

get_parents_siblings([P|Parents], Result, Z):-
    siblings(P, S),
    append(S, Z, X),
    get_parents_siblings(Parents, Result, X).

get_children([], Result, Z):- Result = Z.

get_children([P|Parents], Result, Z):-
    children(P, O),
    append(O, Z, X),
    get_children(Parents, Result, X).

siblings_of_parents(X, Y):-
    parents(X, Z),
    get_parents_siblings(Z, Y, []).

cousins(X, Y):-
    siblings_of_parents(X, AU),
    get_children(AU, Y, []).
    

