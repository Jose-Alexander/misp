import 'package:flutter/material.dart';

class Ejercicio28 extends StatefulWidget {
  const Ejercicio28({super.key});

  @override
  State<Ejercicio28> createState() => _Ejercicio28State();
}

class _Ejercicio28State extends State<Ejercicio28> {
  final TextEditingController _numeroController = TextEditingController();
  String _resultado = "";
  String _serieVisual = "";
  String _error = "";

  void _calcularSerie() {
    int? n = int.tryParse(_numeroController.text);

    setState(() {
      _error = "";
      _resultado = "";
      _serieVisual = "";
    });

    if (n == null) return;

    // Tu lógica original: Validación si es menor a 8
    if (n < 8) {
      setState(() {
        _error = "Error: El número ingresado es menor a 8";
      });
      return;
    }

    int suma = 0;
    List<int> listaSerie = [];

    // Bucle for: desde 8 hasta N
    for (int x = 8; x <= n; x++) {
      suma += x;
      // Guardamos los primeros números para mostrar la serie visualmente
      if (x < 12) listaSerie.add(x);
    }

    setState(() {
      _resultado = "La suma total es: $suma";

      // Creamos una representación visual de la serie (ej: 8 + 9 + 10... + N)
      if (n > 11) {
        _serieVisual = "${listaSerie.join(' + ')} + ... + $n";
      } else {
        _serieVisual = listaSerie.join(' + ');
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suma de Serie (Ej. 28)"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Icon(Icons.add_chart, size: 80, color: Colors.indigo),
            const SizedBox(height: 20),
            const Text(
              "Suma de serie desde el 8 hasta N",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Ingrese el número enésimo (N)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.tag),
              ),
              onSubmitted: (_) => _calcularSerie(),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcularSerie,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              child: const Text("Calcular Sumatoria"),
            ),
            const SizedBox(height: 30),

            if (_error.isNotEmpty) _mensajeAlerta(_error, Colors.red),

            if (_resultado.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.indigo[50],
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: Colors.indigo),
                ),
                child: Column(
                  children: [
                    Text(
                      _serieVisual,
                      style: const TextStyle(
                        fontSize: 16,
                        fontStyle: FontStyle.italic,
                      ),
                    ),
                    const Divider(height: 25),
                    Text(
                      _resultado,
                      style: const TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
                      ),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _mensajeAlerta(String texto, Color color) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        texto,
        style: TextStyle(color: color, fontWeight: FontWeight.bold),
      ),
    );
  }
}
