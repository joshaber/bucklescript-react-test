module Console = struct
  external log : 'anything -> unit = "console.log" [@@bs.val]
end

module Math = struct
  external random : unit -> float = "Math.random" [@@bs.val]
end

module Document = struct
  type element
  external getElementById : string -> element = "document.getElementById" [@@bs.val]
end

module Date = struct
  external now : unit -> int = "Date.now" [@@bs.val]
end

type timeoutId

external setTimeout : (unit -> unit) -> int -> timeoutId = "" [@@bs.val]
