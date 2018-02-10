package ar.edu.seleccionPersonalMethodDispatch

import java.time.LocalDate
import java.time.ZoneId
import java.util.Date
import org.joda.time.DateTime
import org.joda.time.Period

class DateUtil {

	def static diferenciaCon(LocalDate _date1, LocalDate _date2) {
		val date1 = _date1.convertir
		val date2 = _date2.convertir
		val fecha1 = new DateTime(date1.time)
		val fecha2 = new DateTime(date2.time)
		val period = new Period(fecha2, fecha1)
		period.years + ajustePorPasarse(period)
	}
	
	def static ajustePorPasarse(Period period) {
		if (period.months > 0 || period.days > 0) 1 else 0
	}

	def static convertir(LocalDate date) {
		Date.from(date.atStartOfDay(ZoneId.systemDefault()).toInstant())
	}
}
