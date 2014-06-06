package ar.edu.seleccionPersonal

abstract class Postulante {
	
	def dispatch void validarPostulacion(BusquedaExterna externa){
		// por default ok
	} 
	
	def dispatch void validarPostulacion(BusquedaInterna externa){
		// por default ok
	}
	
	def dispatch void validarPostulacion(BusquedaEspecial externa){
		// por default ok
	}
	
}