let x = empty ;; 
let x = add 1 x ;; 
let x = add 3 x ;; 
let x = add 5 x ;; 
let x = add 7 x ;; 
let x = add 9 x ;; 
let x = add 11 x ;; 
let x = add 13 x ;;

let y = empty ;; 
let y = add 2 y ;; 
let y = add 4 y ;; 
let y = add 6 y ;; 
let y = add 8 y ;; 
let y = add 10 y ;; 
let y = add 12 y ;; 
let y = add 14 y ;; 

let t = join x y ;;

let (e, t) = delete_min t ;;
let (e, t) = delete_min t ;;
let (e, t) = delete_min t ;;
let (e, t) = delete_min t ;;
let (e, t) = delete_min t ;;
let (e, t) = delete_min t ;;
let (e, t) = delete_min t ;;
let (e, t) = delete_min t ;;
let (e, t) = delete_min t ;;
let (e, t) = delete_min t ;;
let (e, t) = delete_min t ;;
let (e, t) = delete_min t ;;
let (e, t) = delete_min t ;;
let (e, t) = delete_min t ;;
let (e, t) = delete_min t ;;
(* 15 times function delete_min - on 15th call throws Empty exception *)

let s = ( join ( Node (0, Node ( 0, Node ( 0, Node ( 0, Node (0, Leaf, 9, Leaf), 7, Leaf), 5, Leaf), 3, Leaf), 1, Leaf) ) 
               ( Node (0, Node ( 0, Node ( 0, Node ( 0, Node (0, Leaf, 10, Leaf), 8, Leaf), 6, Leaf), 4, Leaf), 2, Leaf) ) ) ;;


let (e, s) = delete_min s ;;
let (e, s) = delete_min s ;;
let (e, s) = delete_min s ;;
let (e, s) = delete_min s ;;
let (e, s) = delete_min s ;;
let (e, s) = delete_min s ;;
let (e, s) = delete_min s ;;
let (e, s) = delete_min s ;;
let (e, s) = delete_min s ;;
let (e, s) = delete_min s ;;
let (e, s) = delete_min s ;;
(* 11 times function delete_min - should throw Empty exception *)


join ( Node ( 1, Node (0, Node ( 0, Leaf, 14, Leaf ), 7, Leaf) , 3, Node ( 0, Leaf, 8, Leaf ) ) ) ( Node (0, Node ( 0, Leaf, 10, Leaf ), 5, Node ( 0, Leaf, 12, Leaf ) ) ) ;;
merge ( Node ( 1, Node (0, Node ( 0, Leaf, 14, Leaf ), 7, Leaf) , 3, Node ( 0, Leaf, 8, Leaf ) ) ) ( Node (0, Node ( 0, Leaf, 10, Leaf ), 5, Node ( 0, Leaf, 12, Leaf ) ) ) ;;