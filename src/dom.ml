type document
external document : document = "" [@@bs.val]

type element = <
  value : string
> Js.t
external getElementById : document -> string -> element Js.null_undefined = "" [@@bs.send]

type event = <
  preventDefault : unit -> unit
; currentTarget : element
> Js.t
