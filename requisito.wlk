import materia.*
import estudiante.*

class Requisito {
    method cumpleRequisito(materia, estudiante)  
}

object correlativas inherits Requisito {
    override method cumpleRequisito(materia, estudiante) = materia.correlativas().all({materia => estudiante.tieneAprobada(materia)})
}

object creditos inherits Requisito {
    override method cumpleRequisito(materia, estudiante) = estudiante.creditos() >= materia.creditosNecesarios()
}

object año inherits Requisito {
    override method cumpleRequisito(materia, estudiante) = estudiante.año() == materia.añoDeLaMateria()
}

object nada inherits Requisito {
    override method cumpleRequisito(materia, estudiante) = true
}