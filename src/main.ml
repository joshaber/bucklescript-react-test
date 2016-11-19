let () =
  let el = React.div [%bs.obj {className = "outer"}] [|
    React.component MyComponent.c [%bs.obj {name = "willus"}] [||]
  ; React.component MyComponent.c [%bs.obj {name = "tony"}] [||]
  ; React.div [%bs.obj {className = "test"}] [||]
  |] in
  let host = Dom.getElementById Dom.document "host" in
  (* Js.log el; *)
  React.render el host
