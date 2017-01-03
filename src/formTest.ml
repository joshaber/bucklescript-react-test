type props = ()
type state = {
  name : string
; submitCount : int
}

let onSubmit (state : state) (event : Dom.Event.t) =
  Js.log ("eyyyy: " ^ state.name);
  Dom.Event.preventDefault event

let onChange (state : state) (setState : state -> unit) (event : Dom.Event.t) =
  Dom.Event.preventDefault event;
  let v = Dom.Event.getCurrentTarget event |> Dom.Element.getValue in
  setState { state with name = v }

let render (props : props) (state : state) (setState : state -> unit) =
  let greeting = match String.length state.name with
    | 0 -> ""
    | _ -> "Hello " ^ state.name ^ "!"
  in
  React.form (React.props ~onSubmit:(onSubmit state) ()) [|
    React.label (React.props ()) [|
      React.text "Name"
    ; React.input (React.props ~onChange:(onChange state setState) ()) [||]
    ; React.button (React.props ~type_:"submit" ()) [|
        React.text "Submit"
      |]
    ; React.text greeting
    |]
  |]

let t = React.createComponent render {name = "" ; submitCount = 0}
