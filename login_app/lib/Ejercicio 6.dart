import 'package:flutter/material.dart';

class Ejercicio6 extends StatefulWidget {
  const Ejercicio6({super.key});

  @override
  State<Ejercicio6> createState() => _Ejercicio6State();
}

class _Ejercicio6State extends State<Ejercicio6> {
  final TextEditingController _numeroController = TextEditingController();
  String _serieResultados = "";
  String _sumaTotal = "";
  String _error = "";

  void _calcularSerie() {
    int? n = int.tryParse(_numeroController.text);

    setState(() {
      _error = "";
      _serieResultados = "";
      _sumaTotal = "";
    });

    if (n == null || n <= 0) {
      setState(() => _error = "Por favor, ingrese un número entero positivo");
      return;
    }

    int suma = 0;
    String serie = "";

    // Tu algoritmo original (Bucle for)
    for (int x = 1; x <= n; x++) {
      suma = suma + x;
      serie += "n$x: $x\n"; // Vamos acumulando el texto de la serie
    }

    setState(() {
      _serieResultados = serie;
      _sumaTotal = "La suma de la serie es: $suma";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suma de Serie (1 a N)"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Text("Ingrese el número N:", style: TextStyle(fontSize: 16)),
            const SizedBox(height: 10),
            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Valor de N",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: _calcularSerie,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              child: const Text("Generar Serie y Sumar"),
            ),
            const SizedBox(height: 20),
            if (_error.isNotEmpty)
              Text(_error, style: const TextStyle(color: Colors.red)),

            // Área para mostrar la serie (con Scroll)
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: SingleChildScrollView(
                  child: Text(
                    _serieResultados,
                    style: const TextStyle(
                      fontFamily: 'monospace',
                      fontSize: 16,
                    ),
                  ),
                ),
              ),
            ),
            const SizedBox(height: 15),
            Text(
              _sumaTotal,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.indigo,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
