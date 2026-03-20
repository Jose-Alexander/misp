import 'package:flutter/material.dart';
import 'dart:math';

class Ejercicio26 extends StatefulWidget {
  const Ejercicio26({super.key});

  @override
  State<Ejercicio26> createState() => _Ejercicio26State();
}

class _Ejercicio26State extends State<Ejercicio26> {
  final TextEditingController _radioController = TextEditingController();

  // Variables para los resultados
  double _longitud = 0;
  double _area = 0;
  double _volumen = 0;
  bool _calculado = false;

  void _calcularTodo() {
    double? radio = double.tryParse(_radioController.text);
    const double miPi = 3.14; // Usando tu constante del ejercicio

    if (radio == null || radio <= 0) return;

    setState(() {
      // 1. Longitud: 2 * pi * r
      _longitud = 2 * miPi * radio;

      // 2. Área: pi * r²
      _area = miPi * pow(radio, 2).toDouble();

      // 3. Volumen: (4/3) * pi * r³
      _volumen = (4 / 3) * miPi * pow(radio, 3).toDouble();

      _calculado = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Círculo y Esfera (Ej. 26)"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Icon(Icons.blur_circular, size: 80, color: Colors.indigo),
            const SizedBox(height: 20),
            TextField(
              controller: _radioController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Ingrese el Radio (r)",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.adjust),
              ),
              onChanged: (_) => _calcularTodo(), // Cálculo en tiempo real
            ),
            const SizedBox(height: 30),

            if (_calculado) ...[
              _resultadoTile(
                "Longitud Circunferencia",
                _longitud,
                "L = 2 · π · r",
                Colors.blue,
              ),
              _resultadoTile(
                "Área del Círculo",
                _area,
                "A = π · r²",
                Colors.green,
              ),
              _resultadoTile(
                "Volumen de la Esfera",
                _volumen,
                "V = 4/3 · π · r³",
                Colors.orange,
              ),
            ] else
              const Text(
                "Ingrese un radio para ver los cálculos",
                style: TextStyle(
                  color: Colors.grey,
                  fontStyle: FontStyle.italic,
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _resultadoTile(
    String titulo,
    double valor,
    String formula,
    Color color,
  ) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 15),
      child: ListTile(
        leading: CircleAvatar(
          backgroundColor: color,
          child: const Icon(Icons.functions, color: Colors.white),
        ),
        title: Text(
          titulo,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(formula),
        trailing: Text(
          valor.toStringAsFixed(2),
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
            color: color,
          ),
        ),
      ),
    );
  }
}
