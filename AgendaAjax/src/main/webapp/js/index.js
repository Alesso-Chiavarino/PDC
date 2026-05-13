const prioritySelect = document.getElementById("prioritySelect");
const yesRadio = document.getElementById("yesRadio");
const noRadio = document.getElementById("noRadio");
const emailToAdvise = document.getElementById("emailToAdvise");
const calendarInput = document.getElementById("calendarInput");
const inputActionHandler = document.getElementById("inputActionHandler");
const inputIdSetter = document.getElementById("inputIdSetter");

if (calendarInput) {
    calendarInput.addEventListener("submit", async (e) => {
        e.preventDefault();

        const data = new FormData(e.target);
        let URL;

        const action = inputActionHandler.value;

        switch (action) {
            case '': {
                URL = "actions/schedule.jsp"
                break;
            }
            case 'toggle': {
                URL = "actions/toggleDiscard.jsp"
                break;
            }
        }

        const response = await fetch(URL, {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: new URLSearchParams(data)
        });

        if (!response.ok) {
            throw new Error(response.statusText);
        }

        const html = await response.text();

        switch (action) {
            case '': {
                document.getElementById("calendarListRow").insertAdjacentHTML("beforebegin", html);
                break;
            }
            case 'edit': {
                if (inputIdSetter) {
                    document.getElementById("row-" + inputIdSetter.value).outerHTML = html;
                }
                break;
            }
        }

        e.target.reset();

    })
}

if (prioritySelect) {
    prioritySelect.addEventListener("change", (e) => {
        const priorityValue = e.target.value;

        if (priorityValue === "A") {
            yesRadio.checked = true;
            yesRadio.disabled = true;
            noRadio.disabled = true;
            emailToAdvise.disabled = false;
        }
    })
}


if (noRadio) {
    noRadio.addEventListener("change", (e) => {
        const isChecked = e.target.checked
        if (isChecked) {
            emailToAdvise.disabled = false;
            emailToAdvise.value = "";
        }
    })
}

const toggleDiscard = async (id) => {
    debugger
    let confirmValue;
    const selectedRow = document.getElementById(id);
    if (selectedRow) {
        confirmValue = confirm("Seguro que quieres descartar el elemento?");
    }

    if (confirmValue) {
        const response = await fetch("actions/toggleDiscard.jsp", {
            method: "POST",
            headers: {"Content-Type": "application/x-www-form-urlencoded"},
            body: new URLSearchParams({id, action: "update"})
        });

        if (!response.ok) {
            throw new Error(response.statusText);
        }

        const html = await response.text();

        selectedRow.outerHTML = html;
    }
}

window.toggleDiscard = toggleDiscard; //exponemos globalmente la funcion para que el row.jsp pueda acceder
