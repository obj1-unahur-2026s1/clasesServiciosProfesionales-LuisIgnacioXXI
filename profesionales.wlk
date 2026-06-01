import universidades.*
import provincias.*

class Profesional {
    var universidad
    var honorariosPorHora
    var provincias
    method universidad() = universidad
    method honorariosPorHora() = honorariosPorHora
    method provincias() = provincias
}

class ProfesionalVinculado{
    var universidad
    method universidad() = universidad
    method honorariosPorHora() = universidad.honorariosRecomendados()
    method provincias() = #{universidad.provincia()}
    method puedeTrabajarEn(unaProvincia){
        return self.provincias().contains({unaProvincia})
    }
    method cobrarImporte(unImporte){
        universidad.recibirDonacion(unImporte / 2)
    }
}
class ProfesionalLitoral{
    var universidad
    method universidad() = universidad
    method honorariosPorHora() = 3000
    method provincias() = #{entreRios, santaFe, corrientes}
    method puedeTrabajarEn(unaProvincia){
        return self.provincias().contains({unaProvincia})
    }
    method cobrarImporte(unImporte){
        asociacionLitoral.recibirDonacion(unImporte)
    }
}
object asociacionLitoral {
    var cantidadDonaciones = 0
    method recibirDonacion(unaCantidad){
        cantidadDonaciones += unaCantidad
    }
}

class ProfesionalLibre{
    var universidad
    var honorariosPorHora
    var provincias
    var dinero = 0
    method universidad() = universidad
    method honorariosPorHora() = honorariosPorHora
    method provincias() = provincias
    method puedeTrabajarEn(unaProvincia){
        return self.provincias().contains({unaProvincia})
    }
    method cobrarImporte(unImporte){
        dinero += unImporte
    }
    method pasarDinero(unaPersona, unaCantidad){
        unaPersona.cobrarImporte(unaCantidad)
        dinero -= unaCantidad
    }
}



// Profesionales
const juana = new ProfesionalVinculado(
    universidad = uniRosario
)

const melina = new ProfesionalLitoral(
    universidad = uniCorrientes
)

const rocio = new ProfesionalLibre(
    universidad = uniHurlingham,
    honorariosPorHora = 5000,
    provincias = #{santaFe, cordoba, buenosAires}
) 

const luciana = new ProfesionalLibre(
    universidad = uniRosario,
    honorariosPorHora = 3200,
    provincias = #{santaFe, entreRios}
)








