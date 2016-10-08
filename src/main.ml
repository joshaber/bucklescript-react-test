let () =
  let r = MyJs.Math.random () in
  MyJs.Console.log ("hi " ^ (string_of_float r));

  let a = [| 1; 2 |] in
  let e = Array.get a 0 in
  MyJs.Console.log e;

  let fn = fun () -> print_endline "heyyyy" in
  let _ = MyJs.setTimeout fn 1000 in ()
