(window.webpackJsonp=window.webpackJsonp||[]).push([[2],{175:function(t,e,n){var content=n(177);"string"==typeof content&&(content=[[t.i,content,""]]),content.locals&&(t.exports=content.locals);(0,n(56).default)("6759f5ab",content,!0,{sourceMap:!1})},176:function(t,e,n){"use strict";var o=n(175);n.n(o).a},177:function(t,e,n){(e=n(55)(!1)).push([t.i,".container{margin:0 auto;min-height:100vh;display:-webkit-box;display:flex;-webkit-box-pack:center;justify-content:center;-webkit-box-align:center;align-items:center;text-align:center}.title{font-family:Quicksand,Source Sans Pro,-apple-system,BlinkMacSystemFont,Segoe UI,Roboto,Helvetica Neue,Arial,sans-serif;display:block;font-weight:300;font-size:100px;color:#35495e;letter-spacing:1px}.subtitle{font-weight:300;font-size:42px;color:#526488;word-spacing:5px;padding-bottom:15px}.links{padding-top:15px}",""]),t.exports=e},178:function(t,e,n){"use strict";n.r(e);var o={data:function(){return{msg:""}},methods:{showMsg:function(){var t=this;this.$axios.$get("/api/v1/dones").then((function(e){return t.msg=e.msg}))}}},c=(n(176),n(24)),component=Object(c.a)(o,(function(){var t=this.$createElement,e=this._self._c||t;return e("div",[e("button",{on:{click:this.showMsg}},[this._v("Hello")]),this._v("\n  "+this._s(this.msg)+"\n")])}),[],!1,null,null,null);e.default=component.exports}}]);