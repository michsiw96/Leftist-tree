(********************)
(* Zadanie 2        *)
(* Drzewa Lewicowe  *)
(*                  *)
(* Autor:           *) 
(* Michał Siwiński  *)
(*                  *)
(* Code review:     *)
(* Michał Orawiec   *)
(********************)

(* Określenie typu kolejki *)

type height = int ;;

(* typ - długość skrajnie prawej ścieżki *
         lewe poddrzewo *
         wartość w węźle * prawe poddrzewo
         
*)
type 'a queue = 
	| Node of height * 'a queue * 'a * 'a queue 
	| Leaf ;;

(* Funkcje pomocnicze *)

(* swapSubtrees - zamienia lewe poddrzewo z prawym *)
let swapSubtrees t =
	match t with
	| Leaf -> Leaf
	| Node (h, l, x, r) -> Node (h, r, x, l) ;;

(* Wyjątek na wyjątkowe okazje! *)
exception Oops ;;

(* treeVal - zwraca wartość w węźle *)
let treeVal t =
	match t with
	| Node (_, _, x, _) -> x
	| Leaf -> raise Oops ;;

(* treeHeight - zwraca "prawicową" ścieżkę 
zaczynającą się w tym wierzchołku *)
let treeHeight t =
	match t with
	| Node (h, _, _, _) -> h
	| Leaf -> -1 ;;

(* merge - funkcja dokonuje łączenia dwóch kolejek
nie dbając o zachowanie warunku lewicowości - o to
zadbamy w funkcji fix *)
let rec merge q1 q2 =
	match (q1, q2) with
	| (Leaf, _) -> q2
	| (_, Leaf) -> q1
	| (Node (_, l1, x1, r1) , Node (_, l2, x2, r2) ) ->
		if x1 > x2 then ( merge q2 q1 )
		else Node (0, l1, x1, ( merge q2 r1 ) ) ;;

(* fix - przywraca warunek lewicowości - musimy poprawić
tylko skrajnie prawą ścieżkę, bo tylko w niej ten warunek
mógł być zaburzony - dowolne lewe poddrzewa mają zachowany
warunek lewicowości *)
let rec fix t =
	match t with
	| Leaf -> Leaf
	| Node (h, l, x, Leaf) -> Node (0, l, x, Leaf)
	| Node (h, l, x, r) ->
		let fixed = fix r
		in
			if ( treeHeight l ) < ( treeHeight fixed ) then
				swapSubtrees ( Node ( ( treeHeight l ) + 1, l, x, fixed) )
			else Node ( ( treeHeight fixed ) + 1, l, x, fix r) ;;

(* Funkcje główne *)

exception Empty ;;

let empty = Leaf ;;

let is_empty t =
	if t = Leaf then true else false ;;

let join q1 q2 =
	 fix ( merge q1 q2 ) ;;

let add e q =
	join q ( Node (0, Leaf, e, Leaf) ) ;;

let delete_min q =
	match q with
	| Leaf -> raise Empty
	| Node (_, l, x, r) -> (x, join l r) ;; 