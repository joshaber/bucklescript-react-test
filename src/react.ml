[%%bs.raw{|
var _React = require('React')

function _createElement (clazz, props, children) {
  return _React.createElement(clazz, props, ...children)
}

function _createClass (fn) {
  return _React.createClass({
    render: function () {
      return fn(this.props)
    }
  })
}
|}]

type element
type 'a component
external createComponent_ : ('a -> element) -> 'a component = "_createClass" [@@bs.val]

external createComponentElement_ : 'a component -> 'a -> element array -> element = "_createElement" [@@bs.val]
external createBasicElement_ : string -> 'a -> element array -> element = "_createElement" [@@bs.val]

external text : string -> element = "%identity"

(*
 * We have to do this indirection so that BS exports them and can re-import them
 * as known symbols. This is less than ideal.
 *)
let createComponent = createComponent_
let element = createBasicElement_

let div props children = createBasicElement_ "div" props children
let span props children = createBasicElement_ "span" props children
let a props children = createBasicElement_ "a" props children
let button props children = createBasicElement_ "button" props children
let input props children = createBasicElement_ "input" props children

let component component props children = createComponentElement_ component props children

(* -- *)

external render : element -> Dom.element -> unit = "" [@@bs.module "react-dom"]
