class Claro {
  var colonia

  method colonia() = colonia
  method asignarColonia(col) {colonia = col}

  method poderDefensivo() = colonia.poderOfensivo() + 100
}

class Castillo {
  var colonia

  method colonia() = colonia
  method asignarColonia(col) {colonia = col}

  method poderDefensivo() = colonia.criaturas().count({c => c.esFormidable()}) * 200
}