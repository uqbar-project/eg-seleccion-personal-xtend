package ar.edu.seleccionPersonalMethodDispatch

import java.time.LocalDate
import java.time.temporal.ChronoUnit
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Empleado implements Postulante {

	Cargo cargo
	String sector
	LocalDate fechaIngreso
	List<Empleado> personasACargo

	new() {
		personasACargo = new ArrayList<Empleado>
		fechaIngreso = LocalDate.now	
	}
	
	def getFechaAntiguedad(LocalDate dia) {
		ChronoUnit.YEARS.between(fechaIngreso, dia)
	}
	
	def getFechaAntiguedad() {
		LocalDate.now().fechaAntiguedad
	}

	def int cantidadPersonasACargo() {
		personasACargo.size
	}
	
}
