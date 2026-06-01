import provincias.*


class Universidad{
    var provincia
    var honorariosRecomendados
    var cantidadDonaciones = 0
    method recibirDonacion(unaCantidad){
        cantidadDonaciones += unaCantidad
    }
    method provincia() = provincia
    method honorariosRecomendados() = honorariosRecomendados
}

// Universidades
const uniSanMartin = new Universidad(
    provincia = buenosAires, 
    honorariosRecomendados = 3500
)

const uniRosario = new Universidad(
    provincia = santaFe, 
    honorariosRecomendados = 2800
)

const uniCorrientes = new Universidad(
    provincia = corrientes, 
    honorariosRecomendados = 4200
)

const uniHurlingham = new Universidad(
    provincia = buenosAires, 
    honorariosRecomendados = 8800
)
