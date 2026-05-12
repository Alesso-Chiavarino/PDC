const categorySelect = document.getElementById("categorySelect");
const titleInput = document.getElementById("titleInput");
const authorInput = document.getElementById("authorInput");
const urlInput = document.getElementById("urlInput");
const inputIdSetter = document.getElementById("inputIdSetter");
const inputActionHandler = document.getElementById("inputActionHandler");
const videoForm = document.getElementById("videoForm");

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