<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<tr id="recipe-${param.id}">
    <td>
        <strong>${param.name}</strong>
        <div class="small text-secondary">Autor: ${param.author}</div>
    </td>
    <td>${param.category}</td>
    <td>${param.difficulty}</td>
    <td>${param.time} min</td>
    <td><span class="badge text-bg-success">Publicada</span></td>
    <td class="text-end">
        <div class="btn-group btn-group-sm">
            <button type="button" class="btn btn-outline-success" onclick="viewRecipe('${param.id}')">Ver</button>
            <button type="button" class="btn btn-outline-primary" onclick="editRecipe('${param.id}')">Editar</button>
            <button type="button" class="btn btn-outline-danger" onclick="deleteRecipe('${param.id}')">Eliminar</button>
        </div>
    </td>
</tr>
