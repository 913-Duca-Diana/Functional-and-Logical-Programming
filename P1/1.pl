%1.a. Write a predicate to determine the lowest common multiple of a list formed from integer numbers.
%  b. Write a predicate to add a value v after 1-st, 2-nd, 4-th, 8-th, ... element in a list.
%
%a
%Mathematical model
%lcm(a,b)=a*b/gcd(a,b)
%gcd(a,b)=  a, if b=0
%			b, if a=0
%`			gcd(a%b,b), if a>b
%			gcd(a,b%a), otherwise
%flowmodel gcd(i,i,o)
%gcd(A-number, B-number, R-number)
gcd(A,0,A).
gcd(0,B,B).
gcd(A,B,R):-
    A>B,
    A1 is A mod B,
    gcd(A1,B,R).
gcd(A,B,R):-
    B>=A,
    B1 is B mod A,
    gcd(A,B1,R).

%lcm(a,b)=a*b/gcd(a,b)
%lcd(A-number, B-number, R-number)
%flowmodel lcd(i,i,o)

lcm(A,B,R):-
    gcd(A,B,RCGD),
    R is A*B/RCGD.

%b

%Mathematica model
%insertPos(l1...ln,v,pos,idx)=  [], n-0
%								l1+v+insertPos(l2...ln,v,pos*2,idx+1), pos=idx
%								l1+insertPos(l2...ln,v,pos,idx+1), otherwise
%insertPos(L-list, V-number, Pos-number, Idx-number, R-list)
%flowmodel(i,i,i,i,o)

insertPos([],_,_,_,[]).
insertPos([H|T],V,Pos,Idx,[H,V|R]):- Pos=:=Idx,
		Pos1 is Pos*2,
		Idx1 is Idx+1,
		insertPos(T,V,Pos1,Idx1,R).

insertPos([H|T],V,Pos,Idx,[H|R]):- Pos=\=Idx,
		Idx1 is Idx+1,
		insertPos(T,V,Pos,Idx1,R).

%insert(L-list, V-number, R-list)
%insert(i,i,o)
insert(L,V,R):-
    insertPos(L,V,1,1,R).
