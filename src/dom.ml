type document
external document : document = "" [@@bs.val]

type element = <
  value : string
> Js.t
external getElementById : document -> string -> element Js.null_undefined = "" [@@bs.send]

module Event = struct
  type t
  external preventDefault : t -> unit = "" [@@bs.send]

  external currentTarget : t -> element = "" [@@bs.get]
end
