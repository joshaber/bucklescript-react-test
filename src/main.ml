let () =
  let el = React.div [%bs.obj {className = "outer"}] [|
    React.component MyComponent.t [%bs.obj {name = "willus"}] [||]
  ; React.component MyComponent.t [%bs.obj {name = "tony"}] [||]
  ; React.div [%bs.obj {className = "test"}] [||]
  |] in
  let host = Dom.getElementById Dom.document "host" in
  React.render el host
