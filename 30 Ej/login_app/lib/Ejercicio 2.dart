import 'package:flutter/material.dart';

class Ejercicio2 extends StatefulWidget {
  const Ejercicio2({super.key});

  @override
  State<Ejercicio2> createState() => _Ejercicio2State();
}

class _Ejercicio2State extends State<Ejercicio2> {
  // Controlador para el campo de sueldo
  final TextEditingController _sueldoController = TextEditingController();

  // Variables para mostrar los resultados en pantalla
  String _resultadoDescuento = "";
  String _resultadoNeto = "";
  String _mensajeError = "";

  void _calcularSueldo() {
    // 1. Entrada de datos desde el TextField
    double? sueldo = double.tryParse(_sueldoController.text);

    // Limpiar mensajes previos
    setState(() {
      _mensajeError = "";
      _resultadoDescuento = "";
      _resultadoNeto = "";
    });

    if (sueldo == null) {
      setState(() => _mensajeError = "Por favor, ingrese un número válido");
      return;
    }

    // 2. Lógica de rangos (tu código original)
    if (sueldo < 0) {
      setState(() => _mensajeError = "Error: el sueldo no puede ser negativo");
      return;
    }

    double descuento = 0;
    if (sueldo > 2000) {
      descuento = sueldo * 0.03;
    } else if (sueldo > 1000) {
      descuento = sueldo * 0.05;
    } else {
      descuento = sueldo * 0.10;
    }

    double sueldoNeto = sueldo - descuento;

    // 3. Actualizar la interfaz con los resultados
    setState(() {
      _resultadoDescuento = "Descuento: \$${descuento.toStringAsFixed(2)}";
      _resultadoNeto = "Sueldo Neto: \$${sueldoNeto.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cálculo de Sueldo Neto"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Ingrese el sueldo base:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            TextField(
              controller: _sueldoController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: "Sueldo",
                prefixIcon: Icon(Icons.attach_money),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              onPressed: _calcularSueldo,
              icon: const Icon(Icons.calculate),
              label: const Text("Calcular Descuentos"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
              ),
            ),
            const SizedBox(height: 30),

            // Mostrar error si existe
            if (_mensajeError.isNotEmpty)
              Text(
                _mensajeError,
                style: const TextStyle(color: Colors.red, fontSize: 16),
              ),

            // Mostrar resultados
            Text(_resultadoDescuento, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Text(
              _resultadoNeto,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.green,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
