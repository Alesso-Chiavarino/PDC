const formWrapper = document.getElementById("formWrapper");
let currentTargetId;
let action = "";
const recipeList = document.getElementById("recipeList");
const recipeDetailModal = document.getElementById("recipeDetailModal");

formWrapper.addEventListener("submit", async (e) => {
    e.preventDefault();

    const data = new FormData(e.target);
    let URL = "";

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
            recipeList.insertAdjacentHTML("beforebegin", html);
            break;
        }
        case 'edit': {
            document.getElementById("recipe-" + currentTargetId).outerHTML = html;
            break;
        }
    }

    action = "";
    currentTargetId = "";
    formWrapper.innerHTML = await fetch("components/form.jsp").then(r => r.text());

})

const editRecipe = async (id) => {
    const response = await fetch("actions/getForm.jsp", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: new URLSearchParams({id})
    });

    if (!response.ok) throw new Error(response.statusText);

    const html = await response.text();

    formWrapper.innerHTML = html;

    currentTargetId = id;
    action = "edit";

}

const deleteRecipe = async (id) => {
    const response = await fetch("actions/delete.jsp", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: new URLSearchParams({id})
    });

    if (!response.ok) throw new Error(response.statusText);

    document.getElementById("recipe-" + id)?.remove();

}

const viewRecipe = async (id) => {
    const response = await fetch("actions/view.jsp", {
        method: "POST",
        headers: {"Content-Type": "application/x-www-form-urlencoded"},
        body: new URLSearchParams({id})
    });

    if (!response.ok) throw new Error(response.statusText);

    const html = await response.text();

    formWrapper.innerHTML = html;

    currentTargetId = id;

    openModal()

}

const openModal = () => {
    //const embedUrl = url.replace("watch?v=", "embed/");
    //iframe.setAttribute("src", embedUrl);
    new bootstrap.Modal(recipeDetailModal).show();
}