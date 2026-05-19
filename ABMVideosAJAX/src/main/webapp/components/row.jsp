<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<tr id="row-${param.id}">
    <td>
        <div class="d-flex justify-content-between p-2">
            <div>
                <h3 class="text-primary" style="cursor:pointer;"
                    onclick="openModal('${param.url}')">${param.title}</h3>
                <span>${param.author}</span>
            </div>
            <div>
                <button type="button" class="btn btn-primary"
                        onclick="editVideo('${param.id}')">
                    Editar
                </button>
                <button onclick="deleteVideo('${param.id}')" class="btn btn-success
                                ">Eliminar
                </button>
            </div>
        </div>
    </td>
</tr>