%3.a. Define a predicate to remove from a list all repetitive elements. 
%		Eg.: l=[1,2,1,4,1,3,4] => l=[2,3])
%  b. Remove all occurrence of a maximum value from a list on integer numbers.

% Mathematical model
% removeOcc(l1...ln,a)= [], n=0
%						removeOcc(l2...ln), if l1=e
%						l1+removeOcc(l2...ln), otherwise

%removeOcc(L-list,A-number,R-list)
%flowmodel removeOcc(i,i,0)

removeOcc([],_,[]).
removeOcc([H|T],A,R):-
    H=:=A,
    removeOcc(T,A,R).
removeOcc([H|T],A,[H|R]):-
    H=\=A,
    removeOcc(T,A,R).

%Mathematical model
%maximum(a,b) a, if a>b
%		  b, otherwise

%maximum(A-number, B-number,R-number)
%maximum(i,i,o)

maximum(A,B,A):- A>B.
maximum(A,B,B):- B>=A.

%Mathematical model
%maxList(l1...ln) l1, n=1
%			  maximum(l1,maxList(l2...ln)	
%maxList(L-list,R-number)
%flowmodel(i,i,o)

maxList([H],H).
maxList([H|T],R):-
    maxList(T,RM),
    maximum(H,RM,R).

removeMaximum(L,R):-
    maxList(L,RM),
    removeOcc(L,RM,R).
    