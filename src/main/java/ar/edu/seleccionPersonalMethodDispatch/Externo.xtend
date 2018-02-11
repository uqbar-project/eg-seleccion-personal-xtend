package ar.edu.seleccionPersonalMethodDispatch

import java.util.List

class Externo implements Postulante {
	
	List<String> puestosAnteriores = newArrayList
	
	def void trabajarDe(String puesto) {
		puestosAnteriores.add(puesto)
	}
	
	def trabajoEn(String puesto) {
		puestosAnteriores.contains(puesto)
	}

}