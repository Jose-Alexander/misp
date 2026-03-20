import 'package:flutter/material.dart';

class Ejercicio13 extends StatefulWidget {
  const Ejercicio13({super.key});

  @override
  State<Ejercicio13> createState() => _Ejercicio13State();
}

class _Ejercicio13State extends State<Ejercicio13> {
  final TextEditingController _numeroController = TextEditingController();
  String _resultado = "";
  String _error = "";

  void _calcularFactorial() {
    int? numero = int.tryParse(_numeroController.text);

    setState(() {
      _error = "";
      _resultado = "";
    });

    if (numero == null || numero < 0) {
      setState(() => _error = "Por favor, ingrese un número entero positivo");
      return;
    }

    // El factorial de números muy grandes puede superar el límite de 'int'
    // pero para ejercicios escolares suele bastar con int.
    int factorial = 1;

    // Tu lógica original (Bucle for)
    for (int i = 1; i <= numero; i++) {
      factorial = factorial * i;
    }

    setState(() {
      _resultado = "Factorial:\n$numero! = $factorial";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cálculo de Factorial (Ej. 13)"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Icon(Icons.exposure_plus_1, size: 80, color: Colors.indigo),
            const SizedBox(height: 20),
            const Text(
              "Ingrese un número para hallar su factorial:",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Número N",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.functions),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularFactorial,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              child: const Text("Calcular Factorial"),
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
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
                fontFamily: 'monospace',
              ),
            ),
          ],
        ),
      ),
    );
  }
}
