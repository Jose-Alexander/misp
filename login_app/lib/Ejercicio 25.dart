import 'package:flutter/material.dart';
import 'dart:math';

class Ejercicio25 extends StatefulWidget {
  const Ejercicio25({super.key});

  @override
  State<Ejercicio25> createState() => _Ejercicio25State();
}

class _Ejercicio25State extends State<Ejercicio25> {
  final TextEditingController _catetoAController = TextEditingController();
  final TextEditingController _catetoBController = TextEditingController();

  String _resultado = "";
  String _error = "";

  void _calcularHipotenusa() {
    double? a = double.tryParse(_catetoAController.text);
    double? b = double.tryParse(_catetoBController.text);

    setState(() {
      _error = "";
      _resultado = "";
    });

    if (a == null || b == null || a <= 0 || b <= 0) {
      setState(() => _error = "Ingrese valores positivos para los catetos.");
      return;
    }

    // Tu lógica original: Teorema de Pitágoras
    // h = √(a² + b²)
    double sumaCuadrados = pow(a, 2).toDouble() + pow(b, 2).toDouble();
    double hipotenusa = sqrt(sumaCuadrados);

    setState(() {
      _resultado = "La Hipotenusa es:\n${hipotenusa.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Teorema de Pitágoras (Ej. 25)"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Icon(Icons.architecture, size: 80, color: Colors.indigo),
            const SizedBox(height: 10),
            const Text(
              "Cálculo de la Hipotenusa",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            TextField(
              controller: _catetoAController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Cateto A (Base)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.straighten),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _catetoBController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Cateto B (Altura)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.height),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _calcularHipotenusa,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              child: const Text("Calcular Hipotenusa"),
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
            if (_resultado.isNotEmpty)
              Container(
                width: double.infinity,
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
                    fontSize: 24,
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
}
