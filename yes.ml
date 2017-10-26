(* 
 	How to build and execute 
 	
 	Build:
	ocamlopt -o yes yes.ml
	
	option 1 - output 'yes'
	./yes
	
	option 2 - output argument list
	./yes argument_list

*)

let flood str = 
        while true do
        ignore (Printf.printf "%s\n" str);
        done;;

let () = 
        match Sys.argv with
        | [| _; str |] -> flood str
        | _ -> flood "y"
