const quantityInput = document.getElementById("quantityInput");
const colorSelect = document.getElementById("colorSelect");
const postItForm = document.getElementById("postItForm")
const postItContainer = document.getElementById("postItContainer");
let clickTimer = null;


postItForm.addEventListener("submit", async (e) => {
    e.preventDefault();
    const data = new FormData(e.target);
    let URL;
    URL = "actions/save.jsp"

    const params = new URLSearchParams(data)

    for (let i = 0; i < quantityInput.value; i++) {
        const response = await fetch(URL, {
            method: "POST",
            headers: {
                "Content-Type": "application/x-www-form-urlencoded"
            },
            body: params
        });

        if (!response.ok) {
            throw new Error(response.statusText);
        }

        const html = await response.text();

        postItContainer.insertAdjacentHTML("beforeend", html);
    }
    console.log(data)
})

const onClickPostIt = async (event, id) => {
    event.stopPropagation();

    clearTimeout(clickTimer);
    clickTimer = setTimeout(async () => {
        const content = prompt("Escribe el contenido del post it");
        if (!content) return;

        await editPostIt(id, content);
    }, 250);
}

const editPostIt = async (id, content) => {
    const response = await fetch("actions/update.jsp", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: new URLSearchParams({id, content})
    });

    if (!response.ok) throw new Error(response.statusText);

    const html = await response.text();

    document.getElementById("postIt-" + id).outerHTML = html;
}

const onDoubleClickPostIt = async (event, id) => {
    event.stopPropagation();

    clearTimeout(clickTimer);
    clickTimer = null;

    const isConfirmed = confirm("¿Querés eliminar este PostIt?");

    if (!isConfirmed) return;

    await deletePostIt(id);
}

const deletePostIt = async (id) => {
    const response = await fetch("actions/delete.jsp", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: new URLSearchParams({id})
    });

    if (!response.ok) throw new Error(response.statusText);

    const html = await response.text();

    document.getElementById("postIt-" + id)?.remove();
}