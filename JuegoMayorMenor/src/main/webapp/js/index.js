const gameForm = document.getElementById("gameForm");
const minorOrEqualThanList = document.getElementById("minorOrEqualThanList");
const greaterThanList = document.getElementById("greaterThanList");

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

    greaterThanList.insertAdjacentHTML("beforeend", html);

    e.target.reset();

})