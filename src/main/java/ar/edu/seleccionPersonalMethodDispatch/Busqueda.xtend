package ar.edu.seleccionPersonalMethodDispatch

import java.math.BigDecimal
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Busqueda {

	List<Postulante> postulantes = newArrayList
	BigDecimal remuneracion
	String sector
	String puesto

	def agregarPostulante(Postulante postulante) {
		postulantes.add(postulante)
	}

	def postular(Postulante postulante) {
		this.validarPostulacion(postulante)
		this.agregarPostulante(postulante)
	}
	
	def void validarPostulacion(Postulante postulante) {
		// ok		
	}
	
	def boolean estaPostulado(Postulante postulante) {
		postulantes.contains(postulante)
	}
	
}

class BusquedaEspecial extends Busqueda {

	def dispatch validarPostulacion(PersonalContratado empleado) {
		if (empleado.cantidadPersonasACargo < 20) {
			throw new BusinessException("El postulante no tiene más de 20 personas a cargo")
		}
	}

	def dispatch validarPostulacion(Externo externo) {
		if (!externo.trabajoEn(puesto)) {
			throw new BusinessException("Para poder postularse debe haber trabajado anteriormente en el puesto de " + puesto)
		}
	}
	
	def dispatch validarPostulacion(PersonalPlanta empleado) {
		if (remuneracion < empleado.sueldo) {
			throw new BusinessException("La remuneración de la búsqueda debe superar el sueldo actual para postularse a una búsqueda especial")
		}
		if (empleado.cantidadPersonasACargo < 10) {
			throw new BusinessException("Debe tener al menos 10 personas a cargo para postularse a una búsqueda especial")
		}
	}

}

class BusquedaExterna extends Busqueda {

	def dispatch validarPostulacion(PersonalContratado empleado) {
		if (empleado.fechaAntiguedad > 1) {
			throw new BusinessException("El postulante no tiene menos de un año de antigüedad")
		}
	}

	def dispatch validarPostulacion(PersonalPlanta empleado) {
		throw new BusinessException("Un empleado de planta no puede postularse a una búsqueda externa")
	}
	
	def dispatch validarPostulacion(Postulante postulante) {
		
	}
}

class BusquedaInterna extends Busqueda {

	def dispatch validarPostulacion(PersonalContratado empleado) {
		if (!sector.equals(empleado.sector)) {
			throw new BusinessException(
				"El postulante pertenece al sector " + empleado.sector + " y la búsqueda es para " + this.sector)
		}
	}

	def dispatch validarPostulacion(Externo externo) {
		throw new BusinessException("No puede postularse a búsquedas internas")
	}

	def dispatch validarPostulacion(Postulante postulante) {
		
	}
	
}


