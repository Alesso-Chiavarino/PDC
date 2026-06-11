const jListados = {
	getProvincias: async (event) => {
		try {
			event.preventDefault();

			jUtils.clean("iError");
			jUtils.clean("iProvincias");
			jUtils.clean("iLocalidades");

			jUtils.showLoading();

			const response = await fetch("./provincias.jsp", {
				method: "POST",
				headers: {
					"Content-Type": "application/x-www-form-urlencoded"
				},
				body: new URLSearchParams({
					"cod_pais": event.target.value
				})
			});

			if(!response.ok) {
				const text = await response.text();
				throw new Error(text || response.statusText);
			}

			const html = await response.text();
			if (html?.trim() != "") {
				jUtils.show("iProvincias", html);
				document.querySelector("select[name=cod_provincia]").addEventListener("change", jListados.getLocalidades);
			}
			else {
				jListados.getLocalidades();
			}
		}
		catch (error) {
			console.log(error);
			jUtils.show("iError", error.message);
		}
		finally {
			jUtils.hideLoading();
		}
	},

	getLocalidades: async () => {
		try {
			jUtils.showLoading();

			jUtils.clean("iError");
			jUtils.clean("iLocalidades");

			jListados.agregarLocalidad();

			const response = await fetch("./localidades.jsp", {
				method: "POST",
				headers: {
					"Content-Type": "application/x-www-form-urlencoded"
				},
				body: new URLSearchParams({
					"cod_pais": document.querySelector("select[name=cod_pais]").value,
					"cod_provincia": document.querySelector("select[name=cod_provincia]")?.value ?? ''
				})
			});

			if(!response.ok) {
				const text = await response.text();
				throw new Error(text || response.statusText);
			}

			jUtils.show("iLocalidades", await response.text());
			document.querySelector("select[name=nro_localidad]").addEventListener("change", jListados.agregarLocalidad);
		}
		catch (error) {
			console.log(error);
			jUtils.show("iError", error.message);
		}
		finally {
			jUtils.hideLoading();
		}
	},

	agregarLocalidad: (event) => {
		if (event && event.target.value == "-1") {
			document.getElementById("iNuevaLocalidad").classList.remove("d-none");
			document.querySelector("#iNuevaLocalidad input[type=text]").disabled = false;
			document.querySelector("#iNuevaLocalidad input[type=text]").focus();
		}
		else {
			document.getElementById("iNuevaLocalidad").classList.add("d-none");
			document.querySelector("#iNuevaLocalidad input[type=text]").value = "";
			document.querySelector("#iNuevaLocalidad input[type=text]").disabled = true;
		}
	},

	guardar: async () => {
		try {
			jUtils.showLoading();

			jUtils.clean("iError");

			const response = await fetch("./nueva_localidad.jsp", {
				method: "POST",
				headers: {
					"Content-Type": "application/x-www-form-urlencoded"
				},
				body: new URLSearchParams({
					"cod_pais": document.querySelector("select[name=cod_pais]").value,
					"cod_provincia": document.querySelector("select[name=cod_provincia]")?.value ?? '',
					"nom_localidad": document.querySelector("input[name=nom_localidad]").value
				})
			});

			if(!response.ok) {
				const text = await response.text();
				throw new Error(text || response.statusText);
			}

			jListados.agregarLocalidad();
			document.querySelector("select[name=nro_localidad] option:last-child").insertAdjacentHTML("beforebegin", await response.text());
		}
		catch (error) {
			console.log(error);
			jUtils.show("iError", error.message);
		}
		finally {
			jUtils.hideLoading();
		}
	}
};

document.querySelector("select[name=cod_pais]").addEventListener("change", jListados.getProvincias);
document.getElementById("iForm").addEventListener("submit", jListados.guardar);

//Recuperación ante la tecla F5
if(document.querySelector("select[name=cod_pais]").value != "") {
	document.querySelector("select[name=cod_pais]").dispatchEvent(new Event("change"));
}