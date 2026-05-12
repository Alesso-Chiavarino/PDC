const categorySelect = document.getElementById("categorySelect");
const titleInput = document.getElementById("titleInput");
const authorInput = document.getElementById("authorInput");
const urlInput = document.getElementById("urlInput");
const inputIdSetter = document.getElementById("inputIdSetter");
const inputActionHandler = document.getElementById("inputActionHandler");
const videoDetailModal = document.getElementById("videoDetailModal");
const iframe = document.getElementById("iframe");

const editVideo = (id, title, author, category, url) => {
    console.log("test edit", title, author, category, url)
    titleInput.value = title;
    authorInput.value = author;
    categorySelect.value = category;
    urlInput.value = url;

    inputIdSetter.value = id;
    inputActionHandler.value = "edit";

}

const deleteVideo = (id) => {
    if (confirm("Seguro que queres eliminar?")) {
        inputIdSetter.value = id;
        inputActionHandler.value = "delete";
        document.getElementById("videoForm").submit();
    }
}

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
