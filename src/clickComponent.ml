type props = { name : string }

type state = { clickCount : int }

let action (setState : state -> unit) (state : state) (event : Dom.Event.t) =
  Dom.Event.preventDefault event;
  setState { clickCount = state.clickCount + 1 }

let render (props : props) (state : state) (setState : state -> unit) =
  let count = "click count: " ^ string_of_int state.clickCount in
  React.div (React.props ()) [|
    React.text props.name
  ; React.div (React.props ()) [| React.text count |]
  ; React.a (React.props ~onClick:(action setState state) ~href:"" ()) [| React.text "Click me!" |]
  |]

let t = React.createComponent render { clickCount = 0 }
