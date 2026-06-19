object guardian {
  method extra(criatura) = 100
  method esExtraordinario(criatura) = criatura.poderMagico() > 50
}

object hechicero {
  method extra(criatura) = 0
  method esExtraordinario(criatura) = true
}

object domador {
  method extra(criatura) = criatura.mascotas().count({m => m.tieneCuernos()}) * 150

  method esExtraordinario(criatura) =
    criatura.poderMagico() >= 15 &&
    criatura.mascotas().all({m => m.esVeterana()})
}