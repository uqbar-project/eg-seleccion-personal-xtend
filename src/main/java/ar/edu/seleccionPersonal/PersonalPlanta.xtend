package ar.edu.seleccionPersonal

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PersonalPlanta extends Empleado {
	
	Cargo cargo
	
	def sueldo() {
		cargo.sueldo
	}
	
	override validarPostulacion(BusquedaInterna externa) {
		// OK		
	}

	override validarPostulacion(BusquedaExterna externa) {
		throw new UnsupportedOperationException("Un empleado de planta no puede postularse a una búsqueda externa")
	}
	
	override validarPostulacion(BusquedaEspecial externa) {
		if (externa.remuneracion < this.sueldo) {
			throw new UnsupportedOperationException("La remuneración de la búsqueda debe superar el sueldo actual para postularse a una búsqueda externa")
		}
		if (this.cantidadPersonasACargo < 10) {
			throw new UnsupportedOperationException("Debe tener al menos 10 personas a cargo para postularse a una búsqueda externa")
		}
	}
	
}