import 'package:flutter/material.dart';
import 'dart:math';

class Ejercicio22 extends StatefulWidget {
  const Ejercicio22({super.key});

  @override
  State<Ejercicio22> createState() => _Ejercicio22State();
}

class _Ejercicio22State extends State<Ejercicio22> {
  final TextEditingController _numeroController = TextEditingController();

  // Lista para el historial de cálculos
  List<Map<String, dynamic>> _historial = [];
  int _contador = 0;

  void _calcularPotenciaYRaiz() {
    double? numero = double.tryParse(_numeroController.text);

    // Si es nulo o 0, detenemos/limpiamos como en tu lógica original
    if (numero == null || numero == 0) {
      if (numero == 0) {
        _mostrarMensajeFinal();
      }
      return;
    }

    setState(() {
      _contador++;

      // Tu lógica original
      double cubo = pow(numero, 3).toDouble();
      // sqrt() para la raíz cuadrada
      double raiz = double.parse(sqrt(numero).toStringAsFixed(2));

      // Guardamos en el historial
      _historial.insert(0, {
        'id': _contador,
        'num': numero,
        'cubo': cubo,
        'raiz': raiz,
      });

      _numeroController.clear();
    });
  }

  void _mostrarMensajeFinal() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("FINAL DEL PROCESO"),
        content: const Text(
          "Has ingresado 0 o un valor de salida. El proceso ha terminado.",
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              setState(() => _historial.clear()); // Limpiamos al salir
              _contador = 0;
            },
            child: const Text("Aceptar"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cubo y Raíz (Ej. 22)"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Ingrese un número para calcular su cubo y raíz cuadrada (0 para terminar):",
              textAlign: TextAlign.center,
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _numeroController,
              keyboardType: const TextInputType.numberWithOptions(
                decimal: true,
              ),
              decoration: const InputDecoration(
                labelText: "Número",
                border: OutlineInputBorder(),
                suffixIcon: Icon(Icons.calculate),
              ),
              onSubmitted: (_) => _calcularPotenciaYRaiz(),
            ),
            const SizedBox(height: 15),
            ElevatedButton(
              onPressed: _calcularPotenciaYRaiz,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              child: const Text("Calcular"),
            ),
            const Divider(height: 40),
            const Text(
              "RESULTADOS ACUMULADOS:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _historial.length,
                itemBuilder: (context, index) {
                  final item = _historial[index];
                  return Card(
                    elevation: 3,
                    margin: const EdgeInsets.only(bottom: 12),
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.indigo,
                        child: Text(
                          "${item['id']}",
                          style: const TextStyle(color: Colors.white),
                        ),
                      ),
                      title: Text("Número: ${item['num']}"),
                      subtitle: Text(
                        "📦 Cubo: ${item['cubo']}\n📐 Raíz: ${item['raiz']}",
                      ),
                      isThreeLine: true,
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
