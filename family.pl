%Created by Frank Ridder and Vincent Kenbeek

parent(frank, willem).
parent(frank, ina).

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

parent(sorin, jennie).
parent(anita, sjaan).
parent(anita, theo).

parent(thijs, kees).
parent(thijs, joke).

parent(jens, kees).
parent(jens, joke).

parent(bart, kees).
parent(bart, joke).

parent(mariel, dick).
parent(mariel, mary).

parent(stijn, mariel).
parent(stijn, olaf).

parent(gijs, mariel).
parent(gijs, olaf).

parent(adrie, jan_1).
parent(adrie, vera).

parent(johan, adrie).
parent(johan, els).

parent(peter, adrie).
parent(peter, els).

parent(rick, peter).
parent(mark, peter).
parent(silvia, peter).
parent(rick, marga).
parent(mark, marga).
parent(silvia, marga).


parent(carlos, meindert).
parent(carlos, willem).

parent(sandra, sjaan).
parent(sandra, theo).

parent(eric, sjaan).
parent(eric, theo).

parent(lars, sandra).
parent(lars, rob).

parent(pelayo, eric).
parent(pelayo, teresse).

parent(dennis, carlos).
parent(dennis, anita).

parents(X, Y):-
    findall(Z, parent(X, Z), Y).

sibling(X, Y):-
    parent(X, M),
    parent(Y, M),
    X \= Y.

siblings(X, Y):- 
    findall(INPUT, sibling(X, INPUT), S),
    sort(S, Y).

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
    

