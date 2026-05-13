<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<tr id="${param.id}">
    <th scope="row">${param.index + 1}</th>
    <td class="${param.discarted ? 'text-decoration-line-through text-danger' : ''}">${param.date}</td>
    <td class="${param.discarted ? 'text-decoration-line-through text-danger' : ''}">${param.description}</td>
    <td class="${param.discarted ? 'text-decoration-line-through text-danger' : ''}">${param.priority}</td>
    <td class="${param.discarted ? 'text-decoration-line-through text-danger' : ''}">${param.emailToAdvise}</td>
    <td>
        <button type="button" onclick="toggleDiscard('${param.id}')"
                class="btn btn-link p-0 ${param.discarted ? '' : 'text-danger'}">
            ${param.discarted ? 'Recuperar' : 'Descartar'}
        </button>
    </td>

</tr>
