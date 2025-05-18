import carrera.*
import estudiante.*
import requisito.*


class Materia {
    const cupo
    const carrera
    const correlativas
    const creditosQueOtorga
    const creditosNecesarios
    const requisitos
    const estrategias
    const añoDeLaMateria
    const inscriptos = #{}
    const listaDeEspera = #{} 

    method añoDeLaMateria() = añoDeLaMateria

    method correlativas() = correlativas

    method creditosQueOtorga() = creditosQueOtorga

    method creditosNecesarios() = creditosNecesarios

    method inscriptos() = inscriptos

    method listaDeEspera() = listaDeEspera
     
    method estaInscripto(estudiante) = self.inscriptos().any({inscripto => inscripto == estudiante})

    method puedeInscribirse(estudiante) = !self.estaInscripto(estudiante) 
                                        && estudiante.esMateriaDeCarrera(self)
                                        && !estudiante.tieneAprobada(self) 
                                        && requisitos.cumpleRequisito(self, estudiante)

    method validarInscripcion(estudiante) = if (!self.puedeInscribirse(estudiante)) self.error("El estudiante no puede inscribirse a la materia")

    method inscribir(estudiante) {
      self.validarInscripcion(estudiante)
      if (self.hayCupoDisponible()){
        inscriptos.add(estudiante)
      } else {
        listaDeEspera.add(estudiante)
      }
    }

    method agregarAListaDeEspera(estudiante) {
        listaDeEspera.add(estudiante)
    }

    method hayCupoDisponible() = inscriptos.size() < cupo

    method validarListaDeEspera() = if (listaDeEspera.isEmpty()) self.error("La lista de espera está vacia")

    method darDeBaja(estudiante) {
        inscriptos.remove(estudiante)
        self.validarListaDeEspera()
        inscriptos.add(listaDeEspera.asList().first())
        listaDeEspera.remove(listaDeEspera.asList().first())
    }
}