[%%bs.raw{|
var _React = require('React')

function _createElement (clazz, props, children) {
  return _React.createElement(clazz, props, ...children)
}

function _createClass (fn, initialState) {
  return _React.createClass({
    getInitialState: function () {
      return { state: initialState }
    },

    render: function () {
      return fn(this.props, this.state.state, state => this.setState({ state }))
    }
  })
}
|}]

type element
type ('props, 'state) component

type 'state setStateFn = 'state -> unit
type ('props, 'state) renderFn = 'props -> 'state -> 'state setStateFn -> element
external createComponent_ : ('props, 'state) renderFn -> 'state -> ('props, 'state) component = "_createClass" [@@bs.val]

external createComponentElement_ : ('props, 'state) component -> 'props -> element array -> element = "_createElement" [@@bs.val]
external createBasicElement_ : string -> 'props -> element array -> element = "_createElement" [@@bs.val]

(* Needed so that we include strings and elements as children *)
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
let form props children = createBasicElement_ "form" props children
let label props children = createBasicElement_ "label" props children
let p props children = createBasicElement_ "p" props children

let component component props children = createComponentElement_ component props children

(* -- *)

external render : element -> Dom.element -> unit = "" [@@bs.module "react-dom"]
