document.addEventListener("DOMContentLoaded", function () {
    if (document.getElementsByClassName("edit_recipe").length > 0) {
        directionContainers = document.getElementsByClassName("direction-container");
        for (var i = 0;i < directionContainers.length;i++) {
            directionContainers[i].addEventListener("dragstart", dragstart);
            directionContainers[i].addEventListener("dragover", dragover);
            directionContainers[i].addEventListener("dragenter", dragenter);
            directionContainers[i].addEventListener("drop", drop);
        }
    }
});


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
    orderInputs = document.getElementsByClassName("hidden-order-field");
    for (var i = 0;i < orderInputs.length;i++) {
        orderInputs[i].value = i + 1;
    }
}