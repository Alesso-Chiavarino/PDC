<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<div
        id="postIt-${param.id}"
        class="postit postit-${param.color}"
        tabindex="0"
        role="button"
        aria-label="Nota adhesiva ${param.color}"
        onclick="onClickPostIt(event, '${param.id}')"
        ondblclick="onDoubleClickPostIt(event, '${param.id}')"
>
    ${param.content}
</div>