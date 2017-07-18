let flood str = 
        while true do
        ignore (Printf.printf "%s\n" str);
        done;;

let () = 
        match Sys.argv with
        | [| _; str |] -> flood str
        | _ -> flood "y"
