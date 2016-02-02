package ar.edu.seleccionPersonalMethodDispatch

import ar.edu.seleccionPersonalMethodDispatch.Busqueda

class BusquedaEspecial extends Busqueda {

	def dispatch validarPostulacion(PersonalContratado empleado) {
		if (empleado.cantidadPersonasACargo < 20) {
			throw new UnsupportedOperationException("El postulante no tiene más de 20 personas a cargo")
		}
	}

	def dispatch validarPostulacion(Externo externo) {
		if (!externo.trabajoEn(puesto)) {
			throw new UnsupportedOperationException("Para poder postularse debe haber trabajado anteriormente en el mismo puesto")
		}
	}
	
	def dispatch validarPostulacion(PersonalPlanta empleado) {
		if ((remuneracion < empleado.sueldo) || empleado.cantidadPersonasACargo >= 10) {
			throw new UnsupportedOperationException("Debe tener al menos 10 personas a cargo y la remuneración de la búsqueda debe superar el sueldo actual para postularse a una búsqueda externa")
		}
	}

}
