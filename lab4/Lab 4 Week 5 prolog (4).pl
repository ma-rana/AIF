 /*
 * --------Answer: Task 2 -------------------------
 */ 
% predicate food(X) represents the fact that X is food.
% orange is a food
food(orange).
% steak is a food
food(steak).
% apple is a food
food(apple).
% chocolate is a food
food(chocolate).
% predicate eats(X, Y) represents that X eats Y.
% fred eats orange
eats(fred, orange).
% fred eats steak
eats(fred, steak).
% tony eats apple
eats(tony, apple).
% john eats apple
eats(john, apple).
% john eats chocolate
eats(john, chocolate).



/*
 * --------Answer: Task 3 -------------------------
 * 
 * 
  * sum(1,1) predicates define the terminate condition.
  * sum(N,s) defines the recursive rule.
  * sum(6,S) should perform 6 + 5 + 4 + 3 + 2 + 1( stop since there is no loop in
  sum(1,1)).
  * we can see in sum(N, S) the value of N decreases by one and is added to S.
  * ----- Working of recursion --------------
  * sum(6,S) can be thought as :
  * sum(6, sum( 5, sum( 4, sum(3, sum(2, sum( 1, Temp) ) ) ) ) )
  * since from sum(1,Temp ) Temp = 1 ,So
  * sum(6, sum( 5, sum( 4, sum(3, sum(2, 1) ) ) ) ) , N1 = 2 and Temp = 1, so, S is 2 + 1 = 3
  * sum(6, sum( 5, sum( 4, sum(3, 3) ) ) ) and S is 3+ 3 = 6
  * sum(6, sum( 5, sum( 4, 6 ) ) ) and S is 6+ 4 = 10
  * sum(6, sum( 5, 10) ) and S is 10+ 5 = 15
  * sum(6, 15 ) and S is 10+ 5 = 21 .
*/
sum(1, 1).
sum(N, S) :- N1 is N -1, sum(N1, Temp), S is N + Temp.




/*
 * --------Answer: Task 4 -------------------------
 * 
 * 
 * predicts min(first,second, first_or_second_value) represents compare
 * first and second numbers and bind the smallest number to first_or_second_value
 * min(X, X, X) if first and second are equal, bind first.
 * min(X, Y, Y) if Y is smaller than X bind Y.
 * min(X, Y, X) if X is smaller than Y bind X.
*/
min(X, X, X).
min(X, Y, Y) :- X > Y.
min(X, Y, X) :- Y > X.




/*
 * --------Answer: Task 5 -------------------------
 */ 
% stop facts
factorial(0, 1).
% recursive function
factorial(N, F) :- N > 0, N1 is N -1, factorial(N1, F1), F is N * F1.




/*
 * --------Answer: Task 6 -------------------------
 * 
 * Pseudocode:
 * 	create all the flight fact
 *  for trip(X,Y) input return true if there is max 3 link from X to Y.
 * 		i.e. if one link, then flight(X,Y) is present.
 * 		i.e. if two link, then flight(X,Transit) and flight(Transit,Y)  is present.
 * 		i.e. if three link ,then flight(X,Transit1) and flight(Transit1,Transit2) and flight(Transit2,Y) is present.
 */ 
flight(mel, syd).
flight(mel, per).
flight(mel, ade).
flight(syd, car).
flight(syd, bkh).
flight(car, bri).
flight(bri, dar).
flight(bri, dar).
flight(per, ade).
link(X, Y, 1) :- flight(X, Y).
link(X, Y, N) :- N > 1, N1 is N - 1, link(X, Z, N1), flight(Z, Y).
trip(X, Y) :- link(X, Y, 1).
trip(X, Y) :- link(X, Y, 2).
trip(X, Y) :- link(X, Y, 3).




 /*
 * --------Answer: Task 7 ----------------------------
 * 
 * Pseudocode:
 * 	Set maximum and minimum value for cherry and apple respectively.
 * 	get input from user:
 * 		if input== 0, then print maximum and minimum weight of cherry and apple respectively.
 * 		else , if input =< 10, then compare the input with maximum weight of cherry
 * 			   if input >= 150, then compare the input with minimum weight of apple.
 */ 
% setting the minimum and maximum value and calling the measure predicate
weight :- Max is 5, Min is 250, measure(Min, Max).
input(X) :- read(X), nl.

% predicate: measure(Min,Max) :- Min represents smallest weight of apple and Max represents largest weight of cherry.
% get input and if input is equal to 0 print maximum cherry weight and apple minimum weight.
measure(Min, Max) :- input(X), X == 0, write('max cherry = '), write(Max), write(' min apple = '), write(Min).

% get input and if input is not equal to 0 then compare X with weight.
measure(Min, Max) :- input(X), X =\= 0, compared(X, Min, Max).

% if input is less than or equal to 10 , then we measure cherry weight 
% and if X is greater than Max then we replace max with X.
compared(X, Min, Max) :- X =< 10, larger(X, Max, Temp), measure(Min, Temp).

% if input is less than or equal to 150 , then we measure apple weight
% and if X is smaller than Min then we replace Min with X.
compared(X, Min, Max) :- X >= 150, smaller(X, Min, Temp), measure(Temp, Max).

% selecting largest value for cherry
larger(U, V, V) :- V > U.
larger(U, V, U) :- V =< U.

% selecting smallest value for apple.
smaller(U, V, V) :- V < U.
smaller(U, V, U) :- V >= U.




/* 
 * --------Answer: Task 8 ----------------------------
 * 
 * Pseudocode:
 * 	get input from user.
 * 		if input is even number print the number.
 *  	else print all odd number from input to 1.
 * 
 * 
 * numberGame(X) :- condition -> if True ; if False
 * numberGame(X) :- Y is (X mod 2), Y > 0 -> np(X); write(X)
 * Y is (X mod 2), Y > 0 check if X is odd number
 * if X is odd call np(X) else just write the number.
 * np(1) if 1 write 1 and stop, otherwise ( acts as stop case).
 * np(X) :- for all number greater than 1 write X add space and subtract X by 2 and recursively call.
 *
*/
numberGame(X) :- Y is (X mod 2), Y > 0 -> np(X); write(X),!.
np(1) :- write(1),!.
np(X) :- write(X), write(' '), X2 is X - 2, np(X2).

