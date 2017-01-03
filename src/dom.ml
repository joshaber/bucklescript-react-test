type document
external document : document = "" [@@bs.val]

module Element = struct
  type t

  external getValue : t -> string = "value" [@@bs.get]
end

external getElementById : document -> string -> Element.t Js.null_undefined = "" [@@bs.send]

module Event = struct
  type t
  external preventDefault : t -> unit = "" [@@bs.send]

  external getCurrentTarget : t -> Element.t = "currentTarget" [@@bs.get]
end
