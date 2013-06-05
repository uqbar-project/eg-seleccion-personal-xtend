package ar.edu.seleccionPersonal

class PersonalContratado extends Empleado {

	override validarPostulacion(BusquedaInterna interna) {
		if (!sector.equals(interna.sector)) {
			throw new UnsupportedOperationException(
				"El postulante pertenece al sector " + sector + " y la búsqueda es para " + interna.sector)
		}
	}

	override validarPostulacion(BusquedaExterna externa) {
		if (this.fechaAntiguedad > 1) {
			throw new UnsupportedOperationException("El postulante no tiene menos de un año de antigüedad")
		}
	}

	override validarPostulacion(BusquedaEspecial especial) {
		if (this.cantidadPersonasACargo < 20) {
			throw new UnsupportedOperationException("El postulante no tiene más de 20 personas a cargo")
		}
	}

}
