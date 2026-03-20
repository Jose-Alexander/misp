import 'package:flutter/material.dart';

class Ejercicio23 extends StatefulWidget {
  const Ejercicio23({super.key});

  @override
  State<Ejercicio23> createState() => _Ejercicio23State();
}

class _Ejercicio23State extends State<Ejercicio23> {
  final TextEditingController _num1Controller = TextEditingController();
  final TextEditingController _num2Controller = TextEditingController();

  List<Map<String, dynamic>> _historial = [];
  int _contador = 0;
  bool _procesoFinalizado = false;

  void _procesarCalculo() {
    double? n1 = double.tryParse(_num1Controller.text);

    if (n1 == null) return;

    // Lógica del centinela: si num1 es 0, terminar
    if (n1 == 0) {
      setState(() {
        _procesoFinalizado = true;
        _num1Controller.clear();
        _num2Controller.clear();
      });
      _mostrarDialogoFinal();
      return;
    }

    double? n2 = double.tryParse(_num2Controller.text);
    if (n2 == null) return;

    setState(() {
      _contador++;

      // Cálculos originales
      double suma = n1 + n2;
      double resta = n1 - n2;
      double multi = n1 * n2;
      String divRes = (n2 != 0) ? (n1 / n2).toStringAsFixed(2) : "Indefinida";

      _historial.insert(0, {
        'id': _contador,
        'n1': n1,
        'n2': n2,
        'suma': suma,
        'resta': resta,
        'multi': multi,
        'div': divRes,
      });

      _num1Controller.clear();
      _num2Controller.clear();
    });
  }

  void _mostrarDialogoFinal() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("FINAL DEL PROCESO"),
        content: const Text(
          "Se ingresó '0' en el primer número. El programa ha terminado.",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("Cerrar"),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              _reiniciar();
            },
            child: const Text("Reiniciar Todo"),
          ),
        ],
      ),
    );
  }

  void _reiniciar() {
    setState(() {
      _historial.clear();
      _contador = 0;
      _procesoFinalizado = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calculadora con Centinela"),
        backgroundColor: Colors.indigo,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            if (!_procesoFinalizado) ...[
              const Text(
                "Ingrese números (0 en el primero para salir):",
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _num1Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Primer Número",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 10),
              TextField(
                controller: _num2Controller,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Segundo Número",
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: _procesarCalculo,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Ejecutar Proceso"),
              ),
            ] else
              Center(
                child: Column(
                  children: [
                    const Icon(Icons.stop_circle, size: 60, color: Colors.red),
                    const Text(
                      "Proceso Finalizado",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: _reiniciar,
                      child: const Text("Volver a empezar"),
                    ),
                  ],
                ),
              ),
            const Divider(height: 30),
            Expanded(
              child: ListView.builder(
                itemCount: _historial.length,
                itemBuilder: (context, index) {
                  final h = _historial[index];
                  return Card(
                    child: ListTile(
                      title: Text(
                        "Proceso #${h['id']} (${h['n1']} y ${h['n2']})",
                      ),
                      subtitle: Text(
                        "Suma: ${h['suma']} | Resta: ${h['resta']}\nMult: ${h['multi']} | Div: ${h['div']}",
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
