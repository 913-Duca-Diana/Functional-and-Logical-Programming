/*14.a. Write a predicate to test equality of two sets without using the set difference
  b. Write a predicate to select the n-th element of a given list.
  */
%a)
/* Mathematical model
 * contains(l1...ln,e)= True, l1=e
 * 						False, n=0
 * 						contains(l2...ln,e), otherwise
 * 
 * contains(L-list, E-number)
 * flowmodel(i,i)
 */

contains([V|_],V):-!.
contains([H|_],E):-
    H=:=E,!.
contains([H|T],E):-
    H=\=E,
    contains(T,E).

/*Mathematical model
 * removeOcc(l1...ln,e,)=[], n=0
 * 			  removekOcc(l2...ln), l1=e	
 * 			  l1+removekOcc(l2...ln), otherwise
 */
%removeOcc(L-list,E-number,R-list)
%flowmodel(i,i,o)
rmvOcc([],_,[]).
rmvOcc([H|T], E, R):-
    H=:=E,
    rmvOcc(T,E,R).
rmvOcc([H|T],E,[H|R]):-
    H=\=E,
    rmvOcc(T,E,R).

/*Mathematical model
 * equal(a1...an,b1...bm)=  true, if n=0
 * 							equal(rmvOcc(a2...an,b1), rmvOcc(b2...bn,a1)), if  contains(a1...an, b1)=true and contains(b1...bn, a2)=true
 * 							false, otherwise
 * 
 * flowmodel(i,i)
 * equal(A-list, B-list)
 */
equal([],[]).
equal([HA|TA],[HB|TB]):-
    contains([HB|TB],HA),
    contains([HA|TA],HB),
    rmvOcc(TB,HA,RA),
    rmvOcc(TA,HB,RB),
    equal(RA,RB).

%b)
/*Mathematical model:
 * select(l1...ln,k)=  l1, if n=1
 * 						select(l2...ln, n-1), otherwise
 * 
 * select(L-list, N-number, R-number)
 * flowmodel(i,i,o)
 */
select([H|_],1,H):-!.
select([_|T],N,R):-
    N1 is N-1,
    select(T, N1, R).











