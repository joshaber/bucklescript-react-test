type props =  < name : string > Js.t
let action event =
  Js.log "heyoooo";
  Dom.preventDefault event

let render (props : props) = React.div [%bs.obj {className = "custom-render"}] [|
  React.text props##name
; React.div () [| React.text "hi" |]
; React.a [%bs.obj {onClick = action ; href = ""}] [| React.text "Click me!" |]
|]
let c = React.createComponent render
