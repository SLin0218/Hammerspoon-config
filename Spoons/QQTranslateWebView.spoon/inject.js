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
window.preInput = "";
window.inputValue = function (st) {
    if (st === preInput.toLowerCase()) {
        $(".textinput").trigger("focus");
        return;
    }
    window.preInput = st;
    $(".textinput").val(st).trigger("input").trigger("focus");
    setTimeout(() => {
        if ($(".textpanel-source-suggest").css("display") === "block") {
            $($(".suggest-item")[0]).trigger("click");
        }
    }, 2000);
};
window.delByClass("header");
window.delByClass("textpanel-banner");
window.delByClass("layout-float");
window.delByClass("rightLayer");
window.delByClass("dict-banner");
window.delByClass("language");
$(".layout-container").css("margin", "0").css("padding", "40px");
