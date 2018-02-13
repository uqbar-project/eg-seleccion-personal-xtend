package ar.edu.seleccionPersonal

abstract class Postulante {
	
	// Método default para poder compilar
	def void validarPostulacion(Busqueda busqueda) {
		throw new UnsupportedOperationException("Debe utilizar un tipo de búsqueda específico")
	}
	
	def void validarPostulacion(BusquedaExterna externa) 
	
	def void validarPostulacion(BusquedaInterna interna)
	
	def void validarPostulacion(BusquedaEspecial especial)
	
}