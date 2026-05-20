<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<form id="postItForm" novalidate>
    <div class="row g-3 align-items-end">

        <div class="col-12 col-sm-5">
            <label for="quantityInput" class="form-label fw-semibold">
                Cantidad de post-it
            </label>
            <input
                    type="number"
                    id="quantityInput"
                    name="quantity"
                    class="form-control"
                    min="1"
                    placeholder="Ej: 5"
                    aria-describedby="cantidad-ayuda"
            >
            <div id="cantidad-ayuda" class="form-text">
                Indicá cuántas notas querés generar.
            </div>
        </div>

        <div class="col-12 col-sm-5">
            <label for="color" class="form-label fw-semibold">
                Color
            </label>
            <select
                    id="colorSelect"
                    name="color"
                    class="form-select"
                    aria-describedby="color-ayuda"
            >
                <option value="">Selecciona un color</option>
                <option value="rojo">Rojo</option>
                <option value="azul">Azul</option>
                <option value="amarillo">Amarillo</option>
                <option value="verde">Verde</option>
                <option value="negro">Negro</option>
                <option value="blanco">Blanco</option>
            </select>
            <div id="color-ayuda" class="form-text">
                Elegí el color de las notas.
            </div>
        </div>

        <div class="col-12 col-sm-2 d-grid">
            <button type="submit" class="btn btn-primary">
                Crear
            </button>
        </div>

    </div>
</form>
