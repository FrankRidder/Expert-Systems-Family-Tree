%Created by Frank Ridder and Vincent Kenbeek

%Rule for child, parent relationship: parent(child, parent).
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

parent(mark, marga).
parent(mark, peter).

parent(rick, marga).
parent(rick, peter).

parent(silvia, marga).
parent(silvia, peter).

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

%Uses simple forward chaining to find the parents Y of child X
parents(X, Y):-
    findall(Z, parent(X, Z), Y).

%Uses simple forward chaining to find the parent of child X and then uses backwards chaining to find a child Y with the same parent
sibling(X, Y):-
    parent(X, M),
    parent(Y, M),
    X \= Y.

%Uses simple forward chaining to find the parent of child X and then uses backwards chaining to find all children Y with the same parent
siblings(X, Y):- 
    findall(INPUT, sibling(X, INPUT), S),
    sort(S, Y).

%Uses simple forward chaining to find the parents Z1, Z2 of a parent of child X
grandparents(X, Z1, Z2):-
    parent(X,Y1),
    parent(Y1,Z1),
    parent(X,Y2),
    parent(Y2,Z2),
    Z1\=Z2.

%Uses simple forward chaining to find the parent Z of a parent of child X
grandparent(X, Z):-
    parent(X,Y),
    parent(Y,Z).

%Uses simple forward chaining to find the parent of a child
ancestor(X, Y):-
    parent(X, Y).

%Base of the recursive function ancestor
ancestor(X, Y):-
    parent(X, Z),
    ancestor(Z, Y).

%Gets all ancestors Z of child X by using recursive forward chaining
ancestors(X, Z):-
    findall(Y,ancestor(X,Y),Z).

%Uses simple backwards chaining to get child Y of parent X (base of the recursive function)
offspring(X, Y):-
    parent(Y, X).

%Uses simple backwards chaining to get children Y of parent X
children(X, Y):-
    findall(INPUT, parent(INPUT, X), Y).

%Uses recursive backwards chaining to get all offspring Y of parent X
offspring_full(X, Z):-
    findall(Y,offspring(X,Y),Z).

%Uses backwards chaining to find a child of parent X then uses forward chaining to find spouse Y (parent of the same child)
spouse(X, Y):-
    parent(C, X),
    findall(Z, parent(C, Z), [_|Y]).

%Base of a recursive function
get_parents_siblings([], Result, Z):- Result = Z.

%base of recursive base function
get_parents_siblings([P|Parents], Result, Z):-
    siblings(P, S),
    append(S, Z, X),
    get_parents_siblings(Parents, Result, X).

%base of recursive base function
get_children([], Result, Z):- Result = Z.

%base of recursive base function
get_children([P|Parents], Result, Z):-
    children(P, O),
    append(O, Z, X),
    get_children(Parents, Result, X).

%Uses forward chaining to get the parent of X, then finds all children of those parents with recursive backward chaining
siblings_of_parents(X, Y):-
    parents(X, Z),
    get_parents_siblings(Z, Y, []).

%Uses forward chaining to get the parent of X, then finds all children of those parents and returns all childeren of those parent with recursive backward and backwards chaining
cousins(X, Y):-
    siblings_of_parents(X, AU),
    get_children(AU, Y, []).
    
are_cousins(X, Y):-
    cousins(X, C),
    member(Y, C).

