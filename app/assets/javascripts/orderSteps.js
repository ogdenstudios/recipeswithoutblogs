function dragstart(e) {
    source = e.target;
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
        e.target.innerHTML = e.dataTransfer.getData("text");
        updateOrders();
    }
}

function updateOrders() {
    var orderInputs = document.getElementsByClassName("hidden-order-field");
    for (var i = 0;i < orderInputs.length;i++) {
        orderInputs[i].value = i + 1;
    }
}