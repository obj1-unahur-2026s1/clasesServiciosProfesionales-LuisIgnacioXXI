class Empresa{
    const profesionales = #{}
    const clientes = #{}
    var honorarioReferencia

    method honorarioReferencia() = honorarioReferencia

    method agregarProfesional(unProfesional){
        if(!profesionales.contains(unProfesional)){
            profesionales.add(unProfesional)
        }
    }
    method profesionalesEnUniversidad(unaUniversidad){
        return profesionales.count({p => p.universidad() == unaUniversidad})
    }
    method profesionalesCaros(){
        return profesionales.filter({p => p.honorariosPorHora() > self.honorarioReferencia()})
    }
    method universidadesFormadoras(){
        return profesionales.map({p => p.universidad()}).asSet()
    }
    method profesionalMasBarato(){
        return profesionales.min({p => p.honorariosPorHora()})
    }
    method esDeGenteAcotada(){
        return profesionales.all({p => p.provincias().size() < 4})
    }

    method puedeSatisfacerA(unSolicitante){
        return profesionales.any({p => unSolicitante.puedeSerAtendidoPor(p)})
    }

    method darServicio(unSolicitante){
        if(self.puedeSatisfacerA(unSolicitante)){
            const profesional = profesionales.find(self.puedeSatisfacerA(unSolicitante))
            profesional.cobrarImporte(profesional.honorariosPorHora())
            clientes.add(unSolicitante)
        }
    }

    method cantidadDeClientes(){
        return clientes.size()
    }

    method tieneComoClienteA(unSolicitante){
        return clientes.contains(unSolicitante)
    }

    method esPocoAtractivo(unProfesional){
        return unProfesional.provincias().all({prov => 
                            self.algunoCobraMasBaratoQueEn(unProfesional, prov)})
    }
    method algunoCobraMasBaratoQueEn(unProfesional, unaProvincia){
        return profesionales.any({p => p.honorariosPorHora() < unProfesional.honorariosPorHora()
                                   and p.puedeTrabajarEn(unaProvincia)})
    }
}

