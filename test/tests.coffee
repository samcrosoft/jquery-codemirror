module "Test The Creation of CodeMirror Plugin"
test "If Plugin Is Loaded Into JQuery", () ->
  ok typeof $.fn.codemirror is "function", "CodeMirror Plugin Is Loaded"

module "Test The Operation Of The CodeMirror Plugin"
test "Test If Code Mirror Object Is Returned", () ->
  oV1 = $("textarea.codestart").codemirror
    lineNumbers: true
    matchBrackets: true
    theme: 'neat'

  equal typeof oV1, "object", "Object Returned"
  ok oV1 instanceof CodeMirror, "Object Instance Of CodeMirror"


module "Test The Custom Set Data Properties"
test "Test If Code Mirror Object has linenumbers set to false", () ->
  oV1 = $("textarea.codestart").codemirror()
  equal oV1.getOption("lineNumbers"), false, "Line Number Set To False"

test "Test If Code Mirror Object Mode is Declared To xml", () ->
  oV1 = $("textarea.codestart").codemirror()
  equal oV1.getOption("mode"), "xml", "Code Mirror Object Is Set To xml"
