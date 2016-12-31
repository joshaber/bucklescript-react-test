type props = ()
type state = {
  name : string
; submitCount : int
}

let onSubmit state event =
  Js.log ("eyyyy: " ^ state.name);
  event##preventDefault ()

let onChange state setState event =
  event##preventDefault ();
  let v = event##currentTarget##value in
  setState { state with name = v }

let render (props : props) (state : state) (setState : state -> unit) =
  let greeting = match String.length state.name with
    | 0 -> ""
    | _ -> "Hello " ^ state.name ^ "!"
  in
  React.form [%bs.obj {onSubmit = onSubmit state}] [|
    React.label () [|
      React.text "Name"
    ; React.input [%bs.obj {onChange = onChange state setState}] [||]
    ; React.button [%bs.obj {type_ = "submit"}] [|
        React.text "Submit"
      |]
    ; React.text greeting
    |]
  |]

let t = React.createComponent render {name = "" ; submitCount = 0}
