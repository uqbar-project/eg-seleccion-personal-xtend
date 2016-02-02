package ar.edu.seleccionPersonalMethodDispatch

class BusquedaInterna extends Busqueda {

	def dispatch validarPostulacion(PersonalContratado empleado) {
		if (!sector.equals(empleado.sector)) {
			throw new UnsupportedOperationException(
				"El postulante pertenece al sector " + empleado.sector + " y la búsqueda es para " + this.sector)
		}
	}

	def dispatch validarPostulacion(Externo externo) {
		throw new UnsupportedOperationException("No puede postularse a búsquedas internas")
	}

	def dispatch validarPostulacion(Postulante postulante) {
		
	}
	
}
