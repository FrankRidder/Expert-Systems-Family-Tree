
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

offspring(X, Y):-
    parent(Y, Z) ,
    offspring(X, Z).

%Gaat recusief naar beneden door de familieboom
offspring_full(X, Z):-
    findall(Y,offspring(X,Y),Z).

% vind spouse van X door te kijken wie een child is van X, C vind alle ouders van C en stop ze in Y
spouse(X, Y):-
    parent(C, X),
    findall(Z, parent(C, Z), [_|Y]).
%Returned een list met daarin een list per parent met daarin de siblings maar dan 4x voor welke reden dan ook. Als in je kan 4x op next drukken
%siblings_of_parent(X, Y):-
 %   parents(X, Z),
  %  maplist(siblings, Z, [List1|[List2|_]]),
   % append(List1, List2, Y).
%Returned een list met daarin een list per parent met daarin de siblings
%Misschien kan je dit nog netter krijgen
siblings_of_parent(X, Y):-
    parents(X, Z),
    findall(INPUT, maplist(siblings, Z, INPUT), [Y|[_|[_|[_|_]]]]).

%Hier moet doen nog iets komen wat of de lists in lists uitleest of al je het mooier krijgt gewoon offspring uitvoert voor elke sibling
cousins(X, Y):-
    siblings_of_parent(X, Y).
    %maplist(offspring, Z, Y),
    %append(List1, List2, Y).

