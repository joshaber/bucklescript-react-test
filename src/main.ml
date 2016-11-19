let () =
  let root = React.div [%bs.obj {className = "outer"}] [|
    React.component MyComponent.t [%bs.obj {name = "willus"}] [||]
  ; React.component MyComponent.t [%bs.obj {name = "tony"}] [||]
  ; React.div [%bs.obj {className = "test"}] [||]
  |] in
  let host = Dom.getElementById Dom.document "host" in
  match Js.Null.to_opt host with
    | None -> Js.log "Uhhhhhh shit's broke"
    | Some host -> React.render root host
