%sum(1,1):- !.
%sum(N,S):- N1 is N-1, sum(N1,Temp),S is Temp + N.
fac(1,1):- !.
fac(N,F):- N1 is N-1,fac(N1,Tempnum), F is Tempnum * N.