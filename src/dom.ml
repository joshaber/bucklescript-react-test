type document
external document : document = "" [@@bs.val]

type element
external getElementById : document -> string -> element Js.null = "" [@@bs.send]

type event
external preventDefault : event -> unit = "" [@@bs.send]
