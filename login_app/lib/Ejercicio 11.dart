import 'package:flutter/material.dart';

class Ejercicio11 extends StatefulWidget {
  const Ejercicio11({super.key});

  @override
  State<Ejercicio11> createState() => _Ejercicio11State();
}

class _Ejercicio11State extends State<Ejercicio11> {
  final TextEditingController _precioController = TextEditingController();
  final TextEditingController _cantidadController = TextEditingController();

  // Variables para la factura
  double _precioVenta = 0;
  double _iva = 0;
  double _precioBruto = 0;
  double _descuento = 0;
  double _totalPagar = 0;
  bool _mostrarFactura = false;

  void _calcularFactura() {
    double? precio = double.tryParse(_precioController.text);
    double? cantidad = double.tryParse(_cantidadController.text);

    if (precio == null || cantidad == null) return;

    setState(() {
      // Tu lógica original
      _precioVenta = precio * cantidad;
      _iva = _precioVenta * 0.15; // 15% IVA
      _precioBruto = _precioVenta + _iva;

      if (_precioBruto > 50) {
        _descuento = _precioBruto * 0.05; // 5% descuento
      } else {
        _descuento = 0;
      }

      _totalPagar = _precioBruto - _descuento;
      _mostrarFactura = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Facturación (Ej. 11)"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            TextField(
              controller: _precioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Precio Unitario",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _cantidadController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Número de Artículos",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.inventory_2),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _calcularFactura,
              icon: const Icon(Icons.receipt_long),
              label: const Text("Generar Factura"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
            ),
            const SizedBox(height: 30),

            if (_mostrarFactura)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
                  border: Border.all(color: Colors.grey.shade300),
                ),
                child: Column(
                  children: [
                    const Text(
                      "DATOS DE LA FACTURA",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                      ),
                    ),
                    const Divider(),
                    _filaFactura("Precio de venta:", _precioVenta),
                    _filaFactura("IVA (15%):", _iva),
                    _filaFactura("Precio Bruto:", _precioBruto),
                    _filaFactura(
                      "Descuento (5%):",
                      _descuento,
                      color: Colors.red,
                    ),
                    const Divider(),
                    _filaFactura("TOTAL A PAGAR:", _totalPagar, esTotal: true),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _filaFactura(
    String etiqueta,
    double valor, {
    bool esTotal = false,
    Color? color,
  }) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 5),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            etiqueta,
            style: TextStyle(
              fontWeight: esTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: esTotal ? 18 : 16,
            ),
          ),
          Text(
            "\$${valor.toStringAsFixed(2)}",
            style: TextStyle(
              fontWeight: esTotal ? FontWeight.bold : FontWeight.normal,
              fontSize: esTotal ? 18 : 16,
              color: color ?? (esTotal ? Colors.green : Colors.black),
            ),
          ),
        ],
      ),
    );
  }
}
