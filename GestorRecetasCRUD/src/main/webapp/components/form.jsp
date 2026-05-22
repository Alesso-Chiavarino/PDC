<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="card-body" id="formWrapper">
    <form>
        <div class="mb-3">
            <label class="form-label">Nombre de la receta</label>
            <input value="${param.name}" type="text" name="name" class="form-control"
                   placeholder="Ej: Ñoquis de espinaca">
        </div>

        <div class="mb-3">
            <label class="form-label">Autor / Cocinero</label>
            <input value="${param.author}" type="text" name="author" class="form-control" placeholder="Ej: Juan Pérez">
        </div>

        <div class="mb-3">
            <label class="form-label">Descripción corta</label>
            <textarea name="description" class="form-control" rows="2"
                      placeholder="Resumen breve de la receta">${param.description}</textarea>
        </div>

        <div class="mb-3">
            <label class="form-label">Instrucciones completas</label>
            <textarea name="instructions" class="form-control" rows="5"
                      placeholder="Paso 1, paso 2, paso 3...">
                ${param.instructions}
            </textarea>
        </div>

        <div class="row g-3 mb-3">
            <div class="col-12 col-sm-6">
                <label for="categorySelect-${param.id}" class="form-label">Categoría</label>
                <select id="categorySelect-${param.id}" name="category" class="form-select">
                    <option value="" ${empty param.category ? 'selected' : ''}>Seleccionar</option>
                    <option value="E" ${param.category eq 'E' ? 'selected' : ''}>Entrada</option>
                    <option value="PP" ${param.category eq 'PP' ? 'selected' : ''}>Plato principal</option>
                    <option value="P" ${param.category eq 'P' ? 'selected' : ''}>Postre</option>
                    <option value="B" ${param.category eq 'B' ? 'selected' : ''}>Bebida</option>
                </select>
            </div>
            <div class="col-12 col-sm-6">
                <label for="difficultySelect-${param.id}" class="form-label">Dificultad</label>
                <select name="difficulty" id="difficultySelect-${param.id}" class="form-select">
                    <option ${empty param.difficulty ? 'selected' : '' } value="">Seleccionar</option>
                    <option value="F" ${param.difficulty == "F" ? 'selected' : '' }>Fácil</option>
                    <option value="M" ${param.difficulty == "M" ? 'selected' : '' }>Media</option>
                    <option value="D" ${param.difficulty == "D" ? 'selected' : '' }>Difícil</option>
                </select>
            </div>
        </div>

        <div class="row g-3 mb-3">
            <div class="col-12 col-sm-4">
                <label class="form-label">Porciones</label>
                <input value="${param.slices}" name="slices" type="number" class="form-control" min="1" placeholder="4">
            </div>
            <div class="col-12 col-sm-4">
                <label class="form-label">Tiempo (min)</label>
                <input value="${param.time}" name="time" type="number" class="form-control" min="1" placeholder="45">
            </div>
            <div class="col-12 col-sm-4">
                <label class="form-label">Costo estimado</label>
                <input value="${param.cost}" name="cost" type="number" class="form-control" min="0" step="0.01"
                       placeholder="2500">
            </div>
        </div>

        <div class="mb-3">
            <label class="form-label d-block">Tipo de cocina</label>
            <div class="d-flex flex-wrap gap-3">
                <div class="form-check">
                    <input value="true" name="traditional" class="form-check-input" type="radio"
                        ${not empty param.traditional and param.traditional ne 'false' ? 'checked' : ''}>
                    <label class="form-check-label">Tradicional</label>
                </div>
                <div class="form-check">
                    <input value="true" name="healthy" class="form-check-input" type="radio"
                        ${not empty param.healthy and param.healthy ne 'false' ? 'checked' : ''}>
                    <label class="form-check-label">Saludable</label>
                </div>
                <div class="form-check">
                    <input value="true" name="gourmet" class="form-check-input" type="radio"
                        ${not empty param.gourmet and param.gourmet ne 'false' ? 'checked' : ''}>
                    <label class="form-check-label">Gourmet</label>
                </div>
            </div>
        </div>

        <div class="row g-3 mb-3">
            <div class="col-12 col-sm-6">
                <label class="form-label">Fecha de publicación</label>
                <input value="${param.publicationDate}" name="publicationDate" type="date" class="form-control">
            </div>
            <div class="col-12 col-sm-6">
                <label class="form-label">Imagen (opcional)</label>
                <input value="${param.image}" name="image" type="file" class="form-control">
            </div>
        </div>

        <div class="mb-4">
            <label class="form-label d-block mb-2">Características</label>
            <div class="d-flex flex-column gap-2">
                <div class="form-check">
                    <input value="true" name="suitableCeliacs" class="form-check-input" type="checkbox"
                        ${not empty param.suitableCeliacs and param.suitableCeliacs ne 'false' ? 'checked' : ''}>
                    <label class="form-check-label">Apto celíacos</label>
                </div>
                <div class="form-check">
                    <input value="true" name="vegan" class="form-check-input" type="checkbox"
                        ${not empty param.vegan and param.vegan ne 'false' ? 'checked' : ''}>
                    <label class="form-check-label">Vegano</label>
                </div>
                <div class="form-check">
                    <input value="true" name="lactoseFree" class="form-check-input" type="checkbox"
                        ${not empty param.lactoseFree and param.lactoseFree ne 'false' ? 'checked' : ''}>
                    <label class="form-check-label">Sin lactosa</label>
                </div>
                <div class="form-check">
                    <input value="true" name="spicy" class="form-check-input" type="checkbox"
                        ${not empty param.spicy and param.spicy ne 'false' ? 'checked' : ''}>
                    <label class="form-check-label">Picante</label>
                </div>
            </div>
        </div>

        <div class="d-flex flex-wrap gap-2">
            <button type="submit" class="btn btn-success">Guardar</button>
            <button type="button" class="btn btn-warning text-white">Actualizar</button>
            <button type="button" class="btn btn-danger">Eliminar</button>
            <button type="reset" class="btn btn-outline-secondary">Cancelar</button>
        </div>
    </form>
</div>
