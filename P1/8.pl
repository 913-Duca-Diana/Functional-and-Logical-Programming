/* 
8.a. Write a predicate to determine if a list has even numbers of elements without counting the elements from the list.
  b. Write a predicate to delete first occurrence of the minimum number from a list.
 */
%a)
/* Mathematical model
 * hasEven(l1...ln)= True, if n=0
 * 					 False, if n=1
 * 					 hasEven(l3...ln), otherwise
 */
%hasEven(L-list)
%flowmodel(i)
hasEven([]).
hasEven([_,_|T]):-
    hasEven(T).

%b)
/*Mathematical model
 * minim(a,b)= a, a<b
 * 			   b, b<a
 */
%min(A-number,B-number,R-number)
%flowmodel(i,i,o)
minim(A,B,A):- A<B.
minim(A,B,B):- B=<A.
/*Mathematical model
 * minList(l1...ln)=
 * 					l1, n=1
 * 					minim(l1, miniList(l2...ln)), otherwise
 */
%flowmodel(i,i,o)
%minList(L-list, R-number)
minList([H],H).
minList([H|T],R):-
    minList(T,R1),
    minim(H,R1,R).
