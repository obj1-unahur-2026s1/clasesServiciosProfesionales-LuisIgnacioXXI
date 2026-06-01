class Solicitante{
    method puedeSerAtendidoPor(unProfesional){}
}

class Persona {
    var property provincia
    method puedeSerAtendidoPor(unProfesional){
        return unProfesional.provincias().contains(self.provincia())
    }
}

class Institucion {
    const universidades = #{}
    method puedeSerAtendidoPor(unProfesional){
        return universidades.contains(unProfesional.universidad())
    }
}

class Club {
    const provincias = #{}
    method puedeSerAtendidoPor(unProfesional){
        return !provincias.intersection(unProfesional.provincias()).isEmpty()
    }
}
