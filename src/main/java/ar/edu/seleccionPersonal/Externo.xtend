package ar.edu.seleccionPersonal

import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
class Externo extends Postulante {
	
	List<String> puestosAnteriores
	
	new() {
		puestosAnteriores = new ArrayList<String>	
	}
	
	override validarPostulacion(BusquedaInterna interna) {
		throw new UnsupportedOperationException("No puede postularse a búsquedas internas")
	}

	override validarPostulacion(BusquedaExterna externa) {
		// OK
	}
	
	override validarPostulacion(BusquedaEspecial especial) {
		if (!puestosAnteriores.contains(especial.puesto)) {
			throw new UnsupportedOperationException("Para poder postularse debe haber trabajado anteriormente en el mismo puesto")
		}
	}
	
}