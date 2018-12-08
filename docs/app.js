var app = Elm.Main.init({
    node: document.getElementById("app")
});
var initializer = setInterval(function () {
    var textarea = document.getElementById("editor");
    if (!textarea) {
        return;
    }
    var editor = CodeMirror.fromTextArea(textarea, {
        lineNumbers: true
    });
    editor.setOption("extraKeys", {
        ["Ctrl-S"]: function (cm) {
            app.ports.save.send(editor.doc.getValue());
        },
        ["Cmd-S"]: function (cm) {
            app.ports.save.send(editor.doc.getValue());
        }
    });
    clearInterval(initializer);
}, 10);