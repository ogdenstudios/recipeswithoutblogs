document.addEventListener("DOMContentLoaded", function() {
    if (document.getElementById("recipe-submit")) {
        var descriptionTextarea = document.getElementById("recipe_description");
        updateCharactersLeft();
        descriptionTextarea.addEventListener('input', updateCharactersLeft)
    }
});

function updateCharactersLeft() {
    var descriptionTextarea = document.getElementById("recipe_description");
    var charactersLeft = document.getElementById("charactersLeft");
    charactersLeft.innerText = "(" + descriptionTextarea.value.length + "/280)";
    if (descriptionTextarea.value.length > 280) {
        charactersLeft.style.color = "red";
    } else {
        charactersLeft.style.color = "black";
    }
}