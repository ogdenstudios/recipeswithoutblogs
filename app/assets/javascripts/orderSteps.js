document.addEventListener("DOMContentLoaded", function() {
    if (document.getElementById("recipe-submit")) {
    document.getElementById("recipe-submit").addEventListener("click", updateOrders);
    }
});

function dragstart(e) {
    source = e.target;
    directionValue = e.target.children[1].children[0].value;
    e.dataTransfer.setData("text/plain", e.target.innerHTML);
}
function dragover(e) {
    e.preventDefault();
}

function dragenter(e) {
    e.preventDefault();
}

function drop(e) {
    e.preventDefault();
    e.stopPropagation();
    if (e.target.classList.contains("direction-container")) {
        source.innerHTML = e.target.innerHTML;
        source.children[1].children[0].value = e.target.children[1].children[0].value
        e.target.innerHTML = e.dataTransfer.getData("text");
        e.target.children[1].children[0].value = directionValue
        updateOrders();
    }
}

function updateOrders() {
    var orderInputs = document.getElementsByClassName("hidden-order-field");
    for (var i = 0;i < orderInputs.length;i++) {
        orderInputs[i].value = i + 1;
    }
}