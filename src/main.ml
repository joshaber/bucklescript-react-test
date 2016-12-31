let () =
  let root = React.div () [|
    React.component ClickComponent.t {ClickComponent.name = "jane"} [||]
  ; React.component FormTest.t () [||]
  |] in
  let host = Dom.getElementById Dom.document "host" in
  match Js.Null_undefined.to_opt host with
    | None -> Js.log "Uhhhhhh shit's broke"
    | Some host -> React.render root host
