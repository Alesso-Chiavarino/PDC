const categorySelect = document.getElementById("categorySelect");
const titleInput = document.getElementById("titleInput");
const authorInput = document.getElementById("authorInput");
const urlInput = document.getElementById("urlInput");
const inputIdSetter = document.getElementById("inputIdSetter");
const inputActionHandler = document.getElementById("inputActionHandler");
const videoDetailModal = document.getElementById("videoDetailModal");
const iframe = document.getElementById("iframe");
const videoForm = document.getElementById("videoForm");

videoForm.addEventListener("submit", async (e) => {
    e.preventDefault();

    const data = new FormData(e.target);
    let URL;

    const action = inputActionHandler.value;

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
            document.getElementById("videoListRow").insertAdjacentHTML("beforebegin", html);
            break;
        }
        case 'edit': {
            document.getElementById("row-" + inputIdSetter.value).outerHTML = html;
            break;
        }
    }

    e.target.reset();

})

const editVideo = (id, title, author, category, url) => {
    console.log("test edit", title, author, category, url)
    titleInput.value = title;
    authorInput.value = author;
    categorySelect.value = category;
    urlInput.value = url;

    inputIdSetter.value = id;
    inputActionHandler.value = "edit";

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
    console.log("openModal")
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

