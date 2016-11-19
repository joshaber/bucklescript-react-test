module Fs = struct
  external readFileSync : string -> ([`utf8 | `ascii] [@bs.string]) -> string Js.null = "" [@@bs.module "fs"]
end

module ChildProcess = struct
  type execOptions = < encoding : string > Js.t

  external makeExecOptions : encoding : string -> ?cwd : string -> unit -> execOptions = "" [@@bs.obj]

  external execSync : string -> execOptions -> string = "" [@@bs.module "child_process"]
end
