import 'package:flutter/material.dart';

class Ejercicio9 extends StatefulWidget {
  const Ejercicio9({super.key});

  @override
  State<Ejercicio9> createState() => _Ejercicio9State();
}

class _Ejercicio9State extends State<Ejercicio9> {
  final TextEditingController _notaController = TextEditingController();

  // Variables de control
  int _ca = 0; // Cantidad aprobados
  int _cd = 0; // Cantidad desaprobados
  double _acumuladaApro = 0;
  double _acumuladaDesapro = 0;
  double _totalNotas = 0;
  int _cantidadTotal = 0;

  void _agregarNota() {
    double? nota = double.tryParse(_notaController.text);

    if (nota == null || nota < 0 || nota > 20) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Ingrese una nota válida entre 0 y 20")),
      );
      return;
    }

    setState(() {
      _cantidadTotal++;
      _totalNotas += nota;

      if (nota > 10.5) {
        _ca++;
        _acumuladaApro += nota;
      } else {
        _cd++;
        _acumuladaDesapro += nota;
      }
      _notaController.clear(); // Limpia el campo para la siguiente nota
    });
  }

  void _reiniciar() {
    setState(() {
      _ca = 0;
      _cd = 0;
      _acumuladaApro = 0;
      _acumuladaDesapro = 0;
      _totalNotas = 0;
      _cantidadTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    // Cálculos de promedios
    double promApro = _ca > 0 ? _acumuladaApro / _ca : 0;
    double promDesapro = _cd > 0 ? _acumuladaDesapro / _cd : 0;
    double promFinal = _cantidadTotal > 0 ? _totalNotas / _cantidadTotal : 0;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Gestión de Notas (Ej. 9)"),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(onPressed: _reiniciar, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const Text(
              "Ingrese las notas una por una:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 10),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _notaController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Nota (0-20)",
                      border: OutlineInputBorder(),
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _agregarNota,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Agregar"),
                ),
              ],
            ),
            const Divider(height: 40),
            _resumenCard("Aprobados", _ca.toString(), promApro, Colors.green),
            _resumenCard(
              "Desaprobados",
              _cd.toString(),
              promDesapro,
              Colors.red,
            ),
            const Divider(),
            _resumenCard(
              "PROMEDIO FINAL",
              _cantidadTotal.toString(),
              promFinal,
              Colors.indigo,
              esTotal: true,
            ),
          ],
        ),
      ),
    );
  }

  Widget _resumenCard(
    String titulo,
    String cantidad,
    double promedio,
    Color color, {
    bool esTotal = false,
  }) {
    return Card(
      elevation: esTotal ? 4 : 1,
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
        leading: Icon(Icons.school, color: color),
        title: Text(
          titulo,
          style: TextStyle(
            fontWeight: esTotal ? FontWeight.bold : FontWeight.normal,
          ),
        ),
        subtitle: Text("Cantidad: $cantidad"),
        trailing: Text(
          promedio.toStringAsFixed(1),
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}
