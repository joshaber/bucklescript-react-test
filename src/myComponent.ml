type props = < name : string > Js.t

type state = < clickCount : int > Js.t

let action setState state event =
  Dom.preventDefault event;
  setState [%bs.obj { clickCount = state##clickCount + 1 }]

let render (props : props) (state : state) (setState : state -> unit) =
  let count = "click count: " ^ string_of_int state##clickCount in
  React.div [%bs.obj {className = "custom-render"}] [|
    React.text props##name
  ; React.div () [| React.text count |]
  ; React.a [%bs.obj {onClick = action setState state ; href = ""}] [| React.text "Click me!" |]
  |]

let t = React.createComponent render [%bs.obj { clickCount = 0 }]
