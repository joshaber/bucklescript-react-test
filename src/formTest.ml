type props = ()
type state = < name : string > Js.t

let onSubmit state event =
  Js.log ("eyyyy: " ^ state##name);
  event##preventDefault ()

let onChange setState event =
  event##preventDefault ();
  let v = event##currentTarget##value in
  setState [%bs.obj {name = v}]

let render (props : props) (state : state) (setState : state -> unit) =
  let greeting = match String.length state##name with
    | 0 -> ""
    | _ -> "Hello " ^ state##name ^ "!"
  in
  React.form [%bs.obj {onSubmit = onSubmit state}] [|
    React.label [%bs.obj {className = "thing"}] [|
      React.text "Name"
    ; React.input [%bs.obj {onChange = onChange setState}] [||]
    ; React.button [%bs.obj {type_ = "submit"}] [|
        React.text "Submit"
      |]
    ; React.text greeting
    |]
  |]

let t = React.createComponent render [%bs.obj {name = ""}]
