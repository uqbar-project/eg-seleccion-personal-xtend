package ar.edu.seleccionPersonal

import java.time.LocalDate
import java.time.temporal.ChronoUnit
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

@Accessors
abstract class Empleado extends Postulante {

	Cargo cargo
	String sector
	LocalDate fechaIngreso
	List<Empleado> personasACargo

	new() {
		personasACargo = new ArrayList<Empleado>
		fechaIngreso = LocalDate.now	
	}
	
	def void agregarPersonaACargo(Empleado empleado) {
		personasACargo.add(empleado)
	}
	
	def getFechaAntiguedad(LocalDate dia) {
		ChronoUnit.YEARS.between(fechaIngreso, dia)
	}
	
	def getFechaAntiguedad() {
		LocalDate.now().fechaAntiguedad
	}

	def cantidadPersonasACargo() {
		personasACargo.size
	}
	
}
