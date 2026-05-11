const prioritySelect = document.getElementById("prioritySelect");
const yesRadio = document.getElementById("yesRadio");
const noRadio = document.getElementById("noRadio");
const emailToAdvise = document.getElementById("emailToAdvise");
const calendarInput = document.getElementById("calendarInput");
const dateInput = document.getElementById("dateInput");
const discardBtn = document.getElementById("discardBtn");

let dateValue = "";
let yesRadioValue = false;
let noRadioValue = false;
let emailToAdviseValue = "";
let prioritySelectValue = "M";

prioritySelect.addEventListener("change", (e) => {
    const priorityValue = e.target.value;

    if (priorityValue === "A") {
        yesRadio.checked = true;
        yesRadio.disabled = true;
        noRadio.disabled = true;
        emailToAdvise.disabled = false;
    }
})


noRadio.addEventListener("change", (e) => {
    const isChecked = e.target.checked
    if (isChecked) {
        emailToAdvise.disabled = false;
        emailToAdvise.value = "";
    }
    1
    console.log("isChecked", isChecked)
})

discardBtn.addEventListener("click", (e) => {
    let confirmValue;
    if (discardBtn.classList.contains("text-danger")) {
        confirmValue = confirm("Seguro que quieres descartar el elemento?");
    }

    if (confirmValue) {
        discardBtn.closest("form").submit();
    }
    console.log("discardBtn", value)
})
