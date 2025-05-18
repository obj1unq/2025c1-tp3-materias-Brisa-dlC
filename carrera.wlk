class Carrera {
    const materias = #{}
    const nombre

    method materias() = materias

    method agregarMateria(materia) {
        materias.add(materia)
    }
}