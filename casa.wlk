import cosas.*
import cuentas.*

object casa {
  const property cosas = []
  var property cuenta = cuentaCorriente

  method comprar(cosa) {
    self.gastar(cosa.precio())
    cosas.add(cosa)
  }

  method gastar(importe) {
    cuenta.extraer(importe)
  }

  method dineroDisponible() = cuenta.saldo()

  method cantidadDeCosasCompradas() = cosas.size()

  method tieneComida() = cosas.any({ c => c.esComida() })

  method ultimaCosaComprada() = cosas.last()

  method vieneDeEquiparse() {
    if (cosas.isEmpty()) {
      return false
    } else {
      return self.ultimaCosaComprada().esElectrodomestico() 
      or self.ultimaCosaComprada().precio() > 50000
    }
  }

  method esDerrochona() = self.sumaDePrecioDeCosas() >= 90000

  method sumaDePrecioDeCosas() = cosas.sum({ c => c.precio() })

  method compraMasCara() = cosas.max({ c => c.precio() })

  method electrodomesticosComprados() = cosas.filter({ c => c.esElectrodomestico() })

  method malaEpoca() = cosas.all({ c => c.esComida() })

  method fueComprada(cosa) = cosas.contains(cosa)

  method queFaltaComprar(lista) = lista.filter({ c => not self.fueComprada(c) })

  method cantidadDeComidasCompradas() = cosas.count({ c => c.esComida() })

  method faltaComida() = self.cantidadDeComidasCompradas() < 2
}
