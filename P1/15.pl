/*15.a. Write a predicateto transform a list in a set, considering the first occurrence. 
    Eg: [1,2,3,1,2] is transform in [1,2,3].
   b.  Write  a  predicate  to  decompose  a  list  in  a  list  respecting  the  following:
   [list  of  even  numbers  list  of  odd numbers] and also 
   return the number of even numbers and the numbers of odd numbers
*/
%a)
/*Mathematical model
 * nrOcc(l1...ln,e)=0, n=0
 * 					1+nrOcc(l2...ln), l1=e
 * 					nrOcc(l2...ln), otherwise
 * nrOcc(L-list, E-number, R-number)
 * flowmodel(i,i,o)
 */
nrOcc([],_,0).
nrOcc([H|T],E,R1):-
    H=:=E,
    nrOcc(T,E,R),
    R1 is R+1.
nrOcc([H|T],E,R):-
    H=\=E,
    nrOcc(T,E,R). 
/*Mathematical model
 * deleteOcc(l1...ln,e) = 	[], if n=0
 * 							deleteOcc(l2...ln,e), if l1==e
 * 							deleteOcc(l2...ln,e), otherwise
 * deleteOcc(L-list, E-number, R-list)
 * flowmodel(i,i,o)
 */
deleteOcc([],_,[]).
deleteOcc([H|T],E,R):-
    H=:=E,
    deleteOcc(T,E,R).
deleteOcc([H|T],E,[H|R]):-
    H=\=E,
    deleteOcc(T,E,R).

rezolvare([],[]).
rezolvare([H|T],[H|R]):-
    nrOcc([H|T],H,R1),
    R1>1,
    deleteOcc(T,H,R2),
    rezolvare(R2,R).
    
rezolvare([H|T],[H|R]):-
    nrOcc([H|T],H,R1),
    R1=:=1,
    rezolvare(T,R).
    
%b)
/*
 * Mathematical model
 * decEven(l1...ln)= [], n=0
 * 					l1+decEven(l2...ln), if l1 mod 2 is 0
 * 					decEven(l2...ln), otherwise
 * decEven(L-list,R-list)
 * flowmodel(i,o)
 */
decEven([],[]).
decEven([H|T],[H|R]):-
    K is H mod 2,
    K=:=0,
    decEven(T,R).
decEven([H|T],R):-
    K is H mod 2,
    K=\=0,
    decEven(T,R).
    
/*
 * Mathematical model
 * decOdd(l1...ln)= [], n=0
 * 					l1+decOdd(l2...ln), if l1 mod 2 !=0
 * 					decEven(l2...ln), otherwise
 * decOdd(L-list,R-list)
 * flowmodel(i,o)
 */
decOdd([],[]).
decOdd([H|T],[H|R]):-
    K is H mod 2,
    K=\=0,
    decOdd(T,R).
decOdd([H|T],R):-
    K is H mod 2,
    K=:=0,
    decOdd(T,R).
/*Mathematical model
 * decList(l1...ln)= decEven(l1...ln)+decOdd(l1...ln)
 * 
 * decList(L-list,R-list)
 * flowmodel(i,o)
 */
decList([],[]).
decList(L,[R1|R2]):-
    decEven(L,R1),
    decOdd(L,R2).
    
    
    
    
    