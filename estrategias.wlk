import materia.*

class Estrategia {
    method proximoAlumnoAgregar(materia)
}

object porOrdenLlegada inherits Estrategia {
    override method proximoAlumnoAgregar(materia) = materia.listaDeEspera().head()
}

object porPromedio inherits Estrategia {
    override method proximoAlumnoAgregar(materia) = materia.listaDeEspera().max({enEspera => enEspera.promedio()})
}

object porGradoAvance inherits Estrategia {
    override method proximoAlumnoAgregar(materia) = materia.listaDeEspera().max({enEspera => enEspera.cantMateriasAprobadas()})
}