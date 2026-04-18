import 'package:flutter/material.dart';

class Ejercicio3 extends StatefulWidget {
  const Ejercicio3({super.key});

  @override
  State<Ejercicio3> createState() => _Ejercicio3State();
}

class _Ejercicio3State extends State<Ejercicio3> {
  final TextEditingController _montoController = TextEditingController();
  String _resultado = "";
  String _error = "";

  void _calcularDescuento() {
    double? monto = double.tryParse(_montoController.text);

    setState(() {
      _error = "";
      _resultado = "";
    });

    if (monto == null) {
      setState(() => _error = "Por favor, ingrese un número válido");
      return;
    }

    // Tu lógica original
    if (monto > 100) {
      double descuento = monto * 0.1;
      setState(
        () => _resultado =
            "Monto: \$${monto.toStringAsFixed(2)}\nDescuento (10%): \$${descuento.toStringAsFixed(2)}",
      );
    } else if (monto <= 100 && monto > 0) {
      double descuento = monto * 0.2;
      setState(
        () => _resultado =
            "Monto: \$${monto.toStringAsFixed(2)}\nDescuento (20%): \$${descuento.toStringAsFixed(2)}",
      );
    } else {
      setState(() => _error = "Error: el monto no puede ser negativo");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cálculo de Descuentos"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Text(
              "Ingrese el monto de la compra:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _montoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Monto",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.shopping_cart),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularDescuento,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              child: const Text("Calcular Descuento"),
            ),
            const SizedBox(height: 30),
            if (_error.isNotEmpty)
              Text(
                _error,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            Text(
              _resultado,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, color: Colors.black87),
            ),
          ],
        ),
      ),
    );
  }
}
