const videoDetailModal = document.getElementById("videoDetailModal");
const iframe = document.getElementById("iframe");
let action = "";
let currentTargetId = "";
const formWrapper = document.getElementById('formWrapper')

formWrapper.addEventListener("submit", async (e) => {
    e.preventDefault();

    const data = new FormData(e.target);
    let URL;

    switch (action) {
        case '': {
            URL = "actions/save.jsp"
            break;
        }
        case 'edit': {
            URL = "actions/update.jsp"
            break;
        }
    }

    const params = new URLSearchParams(data)
    if (action === "edit") params.append("id", currentTargetId);

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

    switch (action) {
        case '': {
            document.getElementById("videoListRow").insertAdjacentHTML("beforebegin", html);
            break;
        }
        case 'edit': {
            document.getElementById("row-" + currentTargetId).outerHTML = html;
            break;
        }
    }

    action = "";
    currentTargetId = "";
    formWrapper.innerHTML = await fetch("components/form.jsp").then(r => r.text());

})

const editVideo = async (id) => {
    const response = await fetch("actions/getForm.jsp", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: new URLSearchParams({id, action: "post"})
    });

    if (!response.ok) throw new Error(response.statusText);

    const html = await response.text();

    formWrapper.innerHTML = html;

    currentTargetId = id;
    action = "edit";
    console.log("1", action)

}

const deleteVideo = async (id) => {
    if (!confirm("Seguro que queres eliminar?")) return;

    const response = await fetch("actions/delete.jsp", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: new URLSearchParams({id, action: "delete"})
    });

    if (!response.ok) throw new Error(response.statusText);

    document.getElementById("row-" + id)?.remove();
};


const openModal = (url) => {
    const embedUrl = url.replace("watch?v=", "embed/");
    iframe.setAttribute("src", embedUrl);
    new bootstrap.Modal(videoDetailModal).show();
}

videoDetailModal.addEventListener('hidden.bs.modal', () => {
    iframe.setAttribute("src", "");
});

/* machete eventos modal bootstrap

 ┌─────────────────┬───────────────────────────────────────────┐
│     Evento      │             Cuándo se dispara             │
├─────────────────┼───────────────────────────────────────────┤
│ show.bs.modal   │ Antes de abrirse                          │
├─────────────────┼───────────────────────────────────────────┤
│ shown.bs.modal  │ Después de abrirse (animación terminada)  │
├─────────────────┼───────────────────────────────────────────┤
│ hide.bs.modal   │ Antes de cerrarse                         │
├─────────────────┼───────────────────────────────────────────┤
│ hidden.bs.modal │ Después de cerrarse (animación terminada) │
└─────────────────┴───────────────────────────────────────────┘*/

