package ar.edu.seleccionPersonal

import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Externo extends Postulante {
	
	List<String> puestosAnteriores = newArrayList
	
	def void trabajarDe(String puesto) {
		puestosAnteriores.add(puesto)
	}
	
	def trabajoEn(String puesto) {
		puestosAnteriores.contains(puesto)
	}

	override validarPostulacionBusquedaInterna(BusquedaInterna interna) {
		throw new UnsupportedOperationException("No puede postularse a búsquedas internas")
	}

	override validarPostulacionBusquedaExterna(BusquedaExterna externa) {
		// OK
	}
	
	override validarPostulacionBusquedaEspecial(BusquedaEspecial especial) {
		if (!puestosAnteriores.contains(especial.puesto)) {
			throw new UnsupportedOperationException("Para poder postularse debe haber trabajado anteriormente en el mismo puesto")
		}
	}
	
}