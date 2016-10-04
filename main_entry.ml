external max : int -> int -> int = "Math.max" [@@bs.val]
external writeFileSync : string -> string -> string = "" [@@bs.module "fs"]
external join : string array -> string = "" [@@bs.module "path"] [@@bs.splice]

external readFileSync :
  name:string ->
  ([ `utf8
   | `my_name [@bs.as "ascii"]
   ] [@bs.string]) ->
  string = ""
  [@@bs.module "fs"]

type thing = Thing of int | OtherThing of string

let tryit = function
  | Thing _ -> "i"
  | OtherThing i -> i

let safe_division n = function
  | 0 -> failwith "divide by 0"
  | m -> n / m

let () =
  for i = 0 to 10 do
    Js.log (Fib.fib i)
  done;

  let x = Thing 1 in
  let n = join [| "hi"; "world" |] in

  Js.log (safe_division 1 0);

  Js.log (tryit x);

  Js.log (max 1 2);
  (* Js.log (readFileSync ~name:"/Users/joshaber/Desktop/out.txt" `utf8); *)
  (* Js.log (writeFileSync "/Users/joshaber/Desktop/out.txt" "test"); *)
  Js.log (join [| "test"; "path" |])
