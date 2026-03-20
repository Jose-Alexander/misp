import 'package:flutter/material.dart';

class Ejercicio12 extends StatefulWidget {
  const Ejercicio12({super.key});

  @override
  State<Ejercicio12> createState() => _Ejercicio12State();
}

class _Ejercicio12State extends State<Ejercicio12> {
  final TextEditingController _numeroController = TextEditingController();

  // Contadores
  int _positivos = 0;
  int _negativos = 0;
  int _pares = 0;
  int _impares = 0;
  int _totalIngresados = 0;
  List<int> _historial = [];

  void _procesarNumero() {
    int? numero = int.tryParse(_numeroController.text);

    if (numero == null) return;

    setState(() {
      _totalIngresados++;
      _historial.insert(0, numero); // Agrega al inicio de la lista

      // Lógica Par/Impar
      if (numero % 2 == 0) {
        _pares++;
      } else {
        _impares++;
      }

      // Lógica Positivo/Negativo (0 cuenta como negativo según tu código)
      if (numero > 0) {
        _positivos++;
      } else {
        _negativos++;
      }

      _numeroController.clear();
    });
  }

  void _reiniciar() {
    setState(() {
      _positivos = 0;
      _negativos = 0;
      _pares = 0;
      _impares = 0;
      _totalIngresados = 0;
      _historial.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Contador Estadístico (Ej. 12)"),
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
              "Números ingresados: $_totalIngresados / 50",
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _numeroController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Ingrese un número",
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _procesarNumero(),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _procesarNumero,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Añadir"),
                ),
              ],
            ),
            const SizedBox(height: 20),
            // Panel de estadísticas
            Row(
              children: [
                _statCard("Pares", _pares, Colors.blue),
                _statCard("Impares", _impares, Colors.orange),
              ],
            ),
            Row(
              children: [
                _statCard("Positivos", _positivos, Colors.green),
                _statCard("Negativos", _negativos, Colors.red),
              ],
            ),
            const Divider(height: 30),
            const Text("Historial reciente:"),
            Expanded(
              child: ListView.builder(
                itemCount: _historial.length,
                itemBuilder: (context, index) => Card(
                  child: ListTile(
                    title: Text("Número: ${_historial[index]}"),
                    leading: const Icon(Icons.tag),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _statCard(String titulo, int valor, Color color) {
    return Expanded(
      child: Card(
        color: color.withOpacity(0.1),
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              Text(
                titulo,
                style: TextStyle(color: color, fontWeight: FontWeight.bold),
              ),
              Text(
                "$valor",
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
