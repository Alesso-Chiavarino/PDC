const checkboxes = document.querySelectorAll("input[type=\"checkbox\"]")
const resultBtn = document.getElementById("resultBtn");

const onChangeCheckbox = (event, index) => {
    const currentCheck = event.target;
    const checkboxRows = document.querySelectorAll(`[data-match-id="${index}"]`)
    console.log("row", checkboxRows)

    const localCheckbox = checkboxRows[0];
    const drawCheckbox = checkboxRows[1];
    const visitorCheckbox = checkboxRows[2];
    let isLocal = false;
    let isDraw = false;
    let isVisitor = false;

    switch (currentCheck) {
        case localCheckbox: {
            isLocal = true;
            break;
        }
        case drawCheckbox: {
            isDraw = true;
            break;
        }
        case visitorCheckbox: {
            isVisitor = true;
            break;
        }
    }

    console.log(localCheckbox.checked)
    console.log(drawCheckbox.checked)
    console.log(visitorCheckbox.checked)

    if (currentCheck.checked) { //le doy click, estaba en false, hay que controlar que no haya otros true
        if (isLocal) {
            drawCheckbox.checked = false;
            visitorCheckbox.checked = false;
        }
        if (isDraw) {
            localCheckbox.checked = false;
            visitorCheckbox.checked = false;
        }
        if (isVisitor) {
            drawCheckbox.checked = false;
            localCheckbox.checked = false;
        }
    }

}

resultBtn.addEventListener("click", () => {
    
})