%2.a. Write a predicate to remove all occurrencesof a certain atom from a list.
%  b.Define a predicate to produce a list of pairs (atom n) from an initial list of atoms. In this initial list atom has n occurrences.
%  Eg.:numberatom([1, 2, 1, 2, 1, 3, 1], X) => X =[[1, 4], [2, 2], [3, 1]].

%a

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
%b

%Mathematical model
%countOcc(l1...ln,a) 0,n=0
%					1+countOcc(l2...ln,a), if l1=a
%					countOcc(l2..n,a), otherwise

%countOcc(L-list, A-number, R-number)
%flowmodel(i,i,o)

countOcc([],_,0).
countOcc([H|T],A,R):-
    H=:=A,
    countOcc(T,A,R1),
    R is R1+1.

countOcc([H|T],A,R):-
    H=\=A,
    countOcc(T,A,R).

%Mathematical model
%numberAtom(l1...ln) [], n=0
%					[l1,countOcc(l1...ln, l1)]+numberAtom(l2...ln), otherwise

%numberAton(L-list, R-list)
%flowmodel(i,o)

numberAtom([],[]).
numberAtom([H|T],[[H,RC]|R]):-
    countOcc([H|T],H,RC),
    removeOcc(T,H,RR),
    numberAtom(RR,R).


    
    
    