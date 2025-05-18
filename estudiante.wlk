import maprobada.*
import materia.*
import carrera.*


class Estudiante {
    const mAprobadas = #{}
    const carreras = #{}
    const año

    method año() = año

    method cantMateriasAprobadas() = mAprobadas.size()

    method promedio() = mAprobadas.average({mAprobada => mAprobada.nota()})

    method tieneAprobada(materia) = mAprobadas.any({mAprobada => mAprobada.materia() == materia})

    method registrarAprobacion(materia, nota) {
        self.validarAprobacion(materia)
        mAprobadas.add(new Maprobada(materia = materia, nota = nota, estudiante = self))
    }

    method validarAprobacion(materia) = if (self.tieneAprobada(materia)) self.error("El estudiante ya tiene aprobada la materia")

    method materiasTotales() = carreras.flatMap({carrera => carrera.materias()})

    method esMateriaDeCarrera(materia) = self.materiasTotales().any({materia => materia == materia})

    method materiasEnLasQueEstaInscripto() = self.materiasTotales().filter({materia => materia.estaInscripto(self)})

    method estaInscriptoACarrera(carrera) = carreras.any({carrera => carrera == carrera})

    method validarInscripcionACarrera(carrera) = if (!self.estaInscriptoACarrera(carrera)) self.error("El estudiante no está inscripto a la carrera")

    method materiasEnLasQueSePuedeInscribir(carrera) {
        self.validarInscripcionACarrera(carrera)
        return(carrera.materias().filter({materia => materia.puedeInscribirse(self)}))
    }

    method creditos() = mAprobadas.sum({materia => materia.creditosQueOtorga()})

    method aproboTodasLasDelAñoAnterior(carrera) = self.materiasDelAñoAnteriorDelEstudianteDeLaCarrera(carrera).all({materia => self.tieneAprobada(materia) })

    method materiasDelAñoAnteriorDelEstudianteDeLaCarrera(carrera) = carrera.materias().filter({materia => materia.año() == año -1})

}