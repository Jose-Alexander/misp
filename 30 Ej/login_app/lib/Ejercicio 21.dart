import 'package:flutter/material.dart';

class Ejercicio21 extends StatefulWidget {
  const Ejercicio21({super.key});

  @override
  State<Ejercicio21> createState() => _Ejercicio21State();
}

class _Ejercicio21State extends State<Ejercicio21> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  // Lista para almacenar el historial de procesos (máximo 10)
  List<String> _historial = [];
  int _procesoActual = 0;

  void _realizarOperaciones() {
    double? n1 = double.tryParse(_num1Controller.text);
    double? n2 = double.tryParse(_num2Controller.text);

    if (n1 == null || n2 == null) return;

    setState(() {
      _procesoActual++;

      // Lógica original de operaciones
      double suma = n1 + n2;
      double resta = n1 - n2;
      double multi = n1 * n2;
      String divStr = (n2 != 0) ? (n1 / n2).toStringAsFixed(2) : "Indefinida";

      // Crear el texto del proceso actual
      String resultado =
          "PROCESO N°$_procesoActual:\n"
          "Suma: $suma | Resta: $resta\n"
          "Mult: $multi | Div: $divStr";

      // Insertar al inicio del historial
      _historial.insert(0, resultado);

      // Mantener solo los últimos 10 como en tu bucle
      if (_historial.length > 10) {
        _historial.removeLast();
      }

      // Limpiar campos para el siguiente número
      _num1Controller.clear();
      _num2Controller.clear();
    });
  }

  void _reiniciar() {
    setState(() {
      _historial.clear();
      _procesoActual = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora (Máx 10 Procesos)"),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(onPressed: _reiniciar, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Procesos realizados: $_procesoActual / 10",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _num1Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "N° 1",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: TextField(
                    controller: _num2Controller,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "N° 2",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: _procesoActual < 10 ? _realizarOperaciones : null,
              icon: const Icon(Icons.calculate),
              label: Text(
                _procesoActual < 10 ? "Calcular y Guardar" : "Límite alcanzado",
              ),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
            ),
            const Divider(height: 30),
            const Text(
              "HISTORIAL (Últimos 10)",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _historial.length,
                itemBuilder: (context, index) {
                  return Card(
                    margin: const EdgeInsets.only(bottom: 10),
                    child: Padding(
                      padding: const EdgeInsets.all(12.0),
                      child: Text(
                        _historial[index],
                        style: const TextStyle(fontFamily: 'monospace'),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
