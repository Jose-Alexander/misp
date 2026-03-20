import 'package:flutter/material.dart';
import 'dart:math';

class Ejercicio24 extends StatefulWidget {
  const Ejercicio24({super.key});

  @override
  State<Ejercicio24> createState() => _Ejercicio24State();
}

class _Ejercicio24State extends State<Ejercicio24> {
  final TextEditingController _ladoAController = TextEditingController();
  final TextEditingController _ladoBController = TextEditingController();
  final TextEditingController _ladoCController = TextEditingController();

  String _resultado = "";
  String _error = "";

  void _calcularAreaHeron() {
    double? a = double.tryParse(_ladoAController.text);
    double? b = double.tryParse(_ladoBController.text);
    double? c = double.tryParse(_ladoCController.text);

    setState(() {
      _error = "";
      _resultado = "";
    });

    if (a == null || b == null || c == null) {
      setState(() => _error = "Por favor, ingrese los tres lados.");
      return;
    }

    // Lógica original: Cálculo del semiperímetro (sm)
    double sm = (a + b + c) / 2;

    // Cálculo interno de la Fórmula de Herón
    double calculoInterno = sm * (sm - a) * (sm - b) * (sm - c);

    if (calculoInterno > 0) {
      // Cálculo de la raíz cuadrada con redondeo a 2 decimales
      double area = double.parse(sqrt(calculoInterno).toStringAsFixed(2));
      setState(() {
        _resultado = "Área del triángulo:\n$area unidades²";
      });
    } else {
      setState(() {
        _error = "Los lados ingresados no forman un triángulo válido.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Fórmula de Herón (Ej. 24)"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Icon(Icons.change_history, size: 80, color: Colors.indigo),
            const SizedBox(height: 10),
            const Text(
              "Ingrese la longitud de los tres lados:",
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            _inputLado(_ladoAController, "Lado A"),
            const SizedBox(height: 10),
            _inputLado(_ladoBController, "Lado B"),
            const SizedBox(height: 10),
            _inputLado(_ladoCController, "Lado C"),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _calcularAreaHeron,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              child: const Text("Calcular Área"),
            ),
            const SizedBox(height: 30),
            if (_error.isNotEmpty)
              Text(
                _error,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
            if (_resultado.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.indigo[50],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.indigo),
                ),
                child: Text(
                  _resultado,
                  textAlign: TextAlign.center,
                  style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.indigo,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _inputLado(TextEditingController controller, String etiqueta) {
    return TextField(
      controller: controller,
      keyboardType: TextInputType.number,
      decoration: InputDecoration(
        labelText: etiqueta,
        prefixIcon: const Icon(Icons.straighten),
        border: const OutlineInputBorder(),
      ),
    );
  }
}
