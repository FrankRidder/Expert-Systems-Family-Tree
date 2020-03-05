% A meta-interpreter implementing
% a tiny expert-system
% --------------------------------


ask(H) :-
    askable(H),
    writeln(H),
    read(Answer),
	Answer == yes.

funny(X) :- ask(made_you_laugh(X))

dev(X) :- ask(creates_software(X)), ask(has_degree(X)).


askable(creates_software(_)).
askable(has_degree(_)).

/** <examples>

?- prove(good_pet(tweety)).

*/
