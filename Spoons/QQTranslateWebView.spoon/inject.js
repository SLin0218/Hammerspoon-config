window.delById = function (id) {
    const node = document.getElementById(id);
    node.parentNode.removeChild(node);
};
window.delByClass = function (className) {
    const nodes = document.getElementsByClassName(className);
    for (let i = 0; i < nodes.length; i++) {
        nodes[i].parentNode.removeChild(nodes[i]);
    }
};
window.isHidden = function (el) {
    var style = window.getComputedStyle(el);
    return style.display === "none";
};
window.preInput = "";
window.inputValue = function (dom, st) {
    if (st === preInput.toLowerCase()) {
        return;
    }
    window.preInput = st;
    var evt = new InputEvent("input", {
        inputType: "insertText",
        data: st,
        dataTransfer: null,
        isComposing: false,
    });
    dom.value = st;
    dom.dispatchEvent(evt);
    setTimeout(() => {
        if ($(".textpanel-source-suggest").css("display") === "block") {
            const el = document.getElementsByClassName("suggest-item");
            if (el && el.length > 0 && el[0]) {
                el[0].click();
            }
        }
    }, 2000);
};
window.delByClass("header");
window.delByClass("textpanel-banner");
window.delByClass("layout-float");
window.delByClass("rightLayer");
window.delByClass("dict-banner");
document.getElementsByClassName("language")[0].style["margin-top"] = "30px";
