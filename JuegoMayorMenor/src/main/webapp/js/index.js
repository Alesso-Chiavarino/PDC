const gameForm = document.getElementById("gameForm");
const minorOrEqualThanList = document.getElementById("minorOrEqualThanList");
const greaterThanList = document.getElementById("greaterThanList");
const comparedNumber = 10;
const currentNumberText = document.getElementById("currentNumberText");
const currentNumberTextChild = document.getElementById("currentNumberTextChild");
const gameResultContainer = document.getElementById("gameResultContainer");

gameForm.addEventListener("submit", async (e) => {

    e.preventDefault();

    const data = new FormData(e.target);

    const response = await fetch("actions/generateNumber.jsp", {
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

    const temporalDiv = document.createElement("div");
    temporalDiv.innerHTML = html

    if (temporalDiv.firstElementChild.textContent === "Ganaste") {
        return gameResultContainer.insertAdjacentHTML("beforeend", html);
    }

    if (temporalDiv.firstElementChild.textContent === "Perdiste") {
        return gameResultContainer.insertAdjacentHTML("beforeend", html);
    }

    const generatedNumber = Number(temporalDiv.firstElementChild.textContent)


    if (generatedNumber > comparedNumber) {
        greaterThanList.insertAdjacentHTML("beforeend", html);
    } else {
        minorOrEqualThanList.insertAdjacentHTML("beforeend", html);
    }

    currentNumberTextChild.textContent = generatedNumber;
    currentNumberText.classList = ""


    e.target.reset();

})