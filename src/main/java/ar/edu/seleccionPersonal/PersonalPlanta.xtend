package ar.edu.seleccionPersonal

import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class PersonalPlanta extends Empleado {
	
	Cargo cargo
	
	def sueldo() {
		cargo.sueldo
	}
	
	override validarPostulacionBusquedaInterna(BusquedaInterna externa) {
		// OK		
	}

	override validarPostulacionBusquedaExterna(BusquedaExterna externa) {
		throw new BusinessException("Un empleado de planta no puede postularse a una búsqueda externa")
	}
	
	override validarPostulacionBusquedaEspecial(BusquedaEspecial externa) {
		if (externa.remuneracion < this.sueldo) {
			throw new BusinessException("La remuneración de la búsqueda debe superar el sueldo actual para postularse a una búsqueda externa")
		}
		if (this.cantidadPersonasACargo < 10) {
			throw new BusinessException("Debe tener al menos 10 personas a cargo para postularse a una búsqueda externa")
		}
	}
	
}