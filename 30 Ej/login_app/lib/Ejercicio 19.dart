import 'package:flutter/material.dart';

class Ejercicio19 extends StatefulWidget {
  const Ejercicio19({super.key});

  @override
  State<Ejercicio19> createState() => _Ejercicio19State();
}

class _Ejercicio19State extends State<Ejercicio19> {
  final TextEditingController _numeroController = TextEditingController();
  String _resultado = "";
  String _detalle = "";
  Color _colorResultado = Colors.black;

  void _verificarFraccionario() {
    double? numero = double.tryParse(_numeroController.text);

    if (numero == null) {
      setState(() {
        _resultado = "Error";
        _detalle = "Por favor, ingrese un número válido.";
        _colorResultado = Colors.red;
      });
      return;
    }

    // Tu lógica original: .truncateToDouble() elimina la parte decimal
    double pf = numero.truncateToDouble();

    setState(() {
      if (numero == pf) {
        _resultado = "Número Entero";
        _detalle = "El número $numero no tiene parte fraccionaria.";
        _colorResultado = Colors.green;
      } else {
        _resultado = "Número Decimal";
        _detalle = "El número $numero tiene parte fraccionaria.";
        _colorResultado = Colors.orange;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Detector de Decimales (Ej. 19)"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Icon(Icons.exposure_zero, size: 80, color: Colors.indigo),
            const SizedBox(height: 20),
            const Text(
              "Ingrese un número para verificar si tiene decimales:",
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
                hintText: "Ej: 10.5 o 20",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.numbers),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _verificarFraccionario,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              child: const Text("Verificar Número"),
            ),
            const SizedBox(height: 40),

            // Resultado Visual
            if (_resultado.isNotEmpty)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: _colorResultado.withOpacity(0.1),
                  borderRadius: BorderRadius.circular(15),
                  border: Border.all(color: _colorResultado),
                ),
                child: Column(
                  children: [
                    Text(
                      _resultado,
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: _colorResultado,
                      ),
                    ),
                    const SizedBox(height: 10),
                    Text(
                      _detalle,
                      textAlign: TextAlign.center,
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
              ),
          ],
        ),
      ),
    );
  }
}
