import 'package:flutter/material.dart';

class Ejercicio1 extends StatefulWidget {
  const Ejercicio1({super.key});

  @override
  State<Ejercicio1> createState() => _Ejercicio1State();
}

class _Ejercicio1State extends State<Ejercicio1> {
  // Controladores para leer lo que el usuario escribe
  final TextEditingController _controllerHoras = TextEditingController();
  final TextEditingController _controllerTarifa = TextEditingController();
  String _resultado = "Ingrese los datos para calcular";

  void _calcularSalario() {
    // Intentamos convertir el texto a número
    double? horas = double.tryParse(_controllerHoras.text);
    double? tarifa = double.tryParse(_controllerTarifa.text);

    if (horas == null || tarifa == null) {
      setState(() => _resultado = "Por favor, ingrese números válidos");
      return;
    }

    double salario;
    if (horas > 40) {
      double horasExtras = horas - 40;
      salario = (40 * tarifa) + (horasExtras * tarifa * 1.5);
    } else if (horas >= 0) {
      salario = horas * tarifa;
    } else {
      setState(() => _resultado = "Las horas no pueden ser negativas");
      return;
    }

    // Actualizamos la pantalla con el resultado
    setState(
      () => _resultado = "El salario total es: \$${salario.toStringAsFixed(2)}",
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Calculadora de Salario")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            TextField(
              controller: _controllerHoras,
              decoration: const InputDecoration(labelText: "Horas Trabajadas"),
              keyboardType: TextInputType.number,
            ),
            TextField(
              controller: _controllerTarifa,
              decoration: const InputDecoration(labelText: "Tarifa por Hora"),
              keyboardType: TextInputType.number,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: _calcularSalario,
              child: const Text("Calcular Salario"),
            ),
            const SizedBox(height: 30),
            Text(
              _resultado,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
          ],
        ),
      ),
    );
  }
}
