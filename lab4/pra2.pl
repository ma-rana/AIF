daughter(samantha, rebecca). %samantha is daughter of rebecca
daughter(samantha, michael).
daughter(rebecca, tom). %rebecca is daughter of tom
son(jack, michael). 
male(tom).
male(michael).
male(jack).
parent(rebecca, anna). 
parent(elizabeth, michael).

%parent(X, Y) :- daughter(Y, X).
%parent(X, Y) :- son(Y, X).
%mother(X, Y) :- parent(X, Y), not(male(X)).
%father(X, Y) :- parent(X, Y), male(X).
%grandMother(X, Y) :- mother(X, Z), parent(Z, Y).
%grandFather(X, Y) :- father(X, Z), parent(Z, Y).

%parent(rebecca,samantha) :- daughter(samantha,rebecca).
%parent(michael,samantha) :- son(samantha,michael).
%parent(tom,rebecca) :- daughter(rebecca,tom).
%father(rebecca,tom) :- daughter(tom,rebecca).


%mother(?,samantha) :- daughter(samantha,?).
%mother(?,samantha) :- son(samantha,?).
%father(?,tom) :- daughter(tom,?).
%G