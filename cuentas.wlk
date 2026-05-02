object cuentaCorriente {
  var property saldo = 0

  method depositar(importe) {
    self.saldo (self.saldo() + importe)
  }

  method extraer(importe) {
    self.saldo (self.saldo() - importe)
  }
}

object cuentaConGastos {
  var property saldo = 0

  method depositar(importe) {
    self.saldo (self.saldo() + importe - 200)
  }

  method extraer(importe) {
    const costoExtra = if (importe <= 10000) 200 else importe * 0.02
    self.saldo (self.saldo() - (importe + costoExtra))
  }
}

object cuentaCombinada {
  var property primaria = cuentaCorriente
  var property secundaria = cuentaConGastos

  method saldo() = primaria.saldo() + secundaria.saldo()

  method depositar(importe) {
    primaria.depositar(importe)
  }

  method extraer(importe) {
    if (primaria.saldo() >= importe) {
      primaria.extraer(importe)
    } else {
      const faltante = importe - primaria.saldo()
      primaria.extraer(primaria.saldo())
      secundaria.extraer(faltante)
    }
  }
}
