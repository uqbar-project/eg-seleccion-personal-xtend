package ar.edu.seleccionPersonal

import ar.edu.seleccionPersonal.Busqueda

class BusquedaExterna extends Busqueda {

	def dispatch validarPostulacion(PersonalContratado empleado) {
		if (empleado.fechaAntiguedad > 1) {
			throw new UnsupportedOperationException("El postulante no tiene menos de un año de antigüedad")
		}
	}

	def dispatch validarPostulacion(PersonalPlanta empleado) {
		throw new UnsupportedOperationException("Un empleado de planta no puede postularse a una búsqueda externa")
	}
	
	def dispatch validarPostulacion(Postulante postulante) {
		
	}
}
