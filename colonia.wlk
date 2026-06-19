
class Colonia {
  const criaturas = []

  method criaturas() = criaturas
  method agregarCriatura(c) {criaturas.add(c)}

  method poderOfensivo() = criaturas.sum({c => c.poderOfensivo()})

  method intentarConquistar(area) {
    if (self.poderOfensivo() > area.poderDefensivo()) {
      area.asignarColonia(self)
    } else {
      criaturas.forEach({c => c.perderPoderMagico(0.15)})
    }
  }
}