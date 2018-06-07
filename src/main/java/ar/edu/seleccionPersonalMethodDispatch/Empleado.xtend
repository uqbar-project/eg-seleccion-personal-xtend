package ar.edu.seleccionPersonalMethodDispatch

import java.math.BigDecimal
import java.time.LocalDate
import java.time.temporal.ChronoUnit
import java.util.ArrayList
import java.util.List
import org.eclipse.xtend.lib.annotations.Accessors

interface Postulante {}

@Accessors
abstract class Empleado implements Postulante {
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

	def int cantidadPersonasACargo() {
		personasACargo.size
	}
}

@Accessors
class PersonalPlanta extends Empleado {
	
	Cargo cargo
	
	def sueldo() {
		cargo.sueldo	
	}
	
}

class PersonalContratado extends Empleado {
	@Accessors BigDecimal sueldo
}

class Externo implements Postulante {
	List<Cargo> cargosAnteriores = newArrayList
	
	def void trabajarDe(Cargo cargo) {
		cargosAnteriores.add(cargo)
	}
	
	def trabajoEn(String puesto) {
		puestosAnteriores.contains(puesto)
	}

	def puestosAnteriores() {
		cargosAnteriores.map [ descripcion ]
	}
}

