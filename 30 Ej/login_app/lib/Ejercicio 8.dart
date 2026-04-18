import 'package:flutter/material.dart';

class Ejercicio8 extends StatefulWidget {
  const Ejercicio8({super.key});

  @override
  State<Ejercicio8> createState() => _Ejercicio8State();
}

class _Ejercicio8State extends State<Ejercicio8> {
  // Controladores para capturar el texto
  final TextEditingController _horasController = TextEditingController();
  final TextEditingController _tarifaController = TextEditingController();

  String _resultado = "Esperando datos...";

  void _calcularSalarioSimple() {
    // Conversión de texto a número
    double? horas = double.tryParse(_horasController.text);
    double? tarifa = double.tryParse(_tarifaController.text);

    if (horas == null || tarifa == null) {
      setState(() => _resultado = "Error: Ingrese números válidos");
      return;
    }

    // Tu lógica original: Salario = Horas * Tarifa
    double salario = horas * tarifa;

    setState(() {
      _resultado =
          "El salario del trabajador es:\n\$${salario.toStringAsFixed(2)}";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Salario Simple (Ej. 8)"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Icon(Icons.payments, size: 70, color: Colors.indigo),
            const SizedBox(height: 20),
            TextField(
              controller: _horasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Horas Trabajadas",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.timer),
              ),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _tarifaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Tarifa por Hora",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.monetization_on),
              ),
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _calcularSalarioSimple,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              child: const Text("Calcular Salario"),
            ),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(20),
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.indigo[50],
                borderRadius: BorderRadius.circular(10),
              ),
              child: Text(
                _resultado,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
