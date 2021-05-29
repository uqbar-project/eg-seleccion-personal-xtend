package ar.edu.seleccionPersonal

abstract class Postulante {
	
	// Método default para poder compilar
	def void validarPostulacion(Busqueda busqueda) {
		throw new BusinessException("Debe utilizar un tipo de búsqueda específico")
	}
	
	def void validarPostulacionBusquedaInterna(BusquedaInterna interna)
	
	def void validarPostulacionBusquedaExterna(BusquedaExterna externa) 

	def void validarPostulacionBusquedaEspecial(BusquedaEspecial especial)
	
}