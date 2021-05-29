package ar.edu.seleccionPersonal

class PersonalContratado extends Empleado {

	override validarPostulacionBusquedaInterna(BusquedaInterna interna) {
		if (!sector.equals(interna.sector)) {
			throw new BusinessException(
				"El postulante pertenece al sector " + sector + " y la búsqueda es para " + interna.sector)
		}
	}

	override validarPostulacionBusquedaExterna(BusquedaExterna externa) {
		if (this.fechaAntiguedad > 1) {
			throw new BusinessException("El postulante no tiene menos de un año de antigüedad")
		}
	}

	override validarPostulacionBusquedaEspecial(BusquedaEspecial especial) {
		if (this.cantidadPersonasACargo < 20) {
			throw new BusinessException("El postulante no tiene más de 20 personas a cargo")
		}
	}

}
