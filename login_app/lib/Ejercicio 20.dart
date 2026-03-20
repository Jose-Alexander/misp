import 'package:flutter/material.dart';
import 'dart:math';

class Ejercicio20 extends StatefulWidget {
  const Ejercicio20({super.key});

  @override
  State<Ejercicio20> createState() => _Ejercicio20State();
}

class _Ejercicio20State extends State<Ejercicio20> {
  final TextEditingController _controllerA = TextEditingController();
  final TextEditingController _controllerB = TextEditingController();
  final TextEditingController _controllerC = TextEditingController();

  String _resultado = "Ingrese los coeficientes";
  String _tipoSolucion = "";
  Color _colorEstado = Colors.grey;

  void _resolverCuadratica() {
    double? a = double.tryParse(_controllerA.text);
    double? b = double.tryParse(_controllerB.text);
    double? c = double.tryParse(_controllerC.text);

    if (a == null || b == null || c == null) {
      setState(() {
        _resultado = "Error: Ingrese números válidos";
        _tipoSolucion = "";
        _colorEstado = Colors.red;
      });
      return;
    }

    if (a == 0) {
      setState(() {
        _resultado = "No es una ecuación cuadrática (a no puede ser 0)";
        _tipoSolucion = "Error de Coeficiente";
        _colorEstado = Colors.orange;
      });
      return;
    }

    // Tu lógica original: Cálculo del discriminante b² - 4ac
    double disc = pow(b, 2) - (4 * a * c);

    setState(() {
      if (disc > 0) {
        // Dos raíces reales
        double x1 = (-b + sqrt(disc)) / (2 * a);
        double x2 = (-b - sqrt(disc)) / (2 * a);
        _tipoSolucion = "Dos raíces reales distintas";
        _resultado =
            "x1 = ${x1.toStringAsFixed(2)}\nx2 = ${x2.toStringAsFixed(2)}";
        _colorEstado = Colors.green;
      } else if (disc == 0) {
        // Una raíz única
        double x = -b / (2 * a);
        _tipoSolucion = "Una raíz real única";
        _resultado = "x = ${x.toStringAsFixed(2)}";
        _colorEstado = Colors.blue;
      } else {
        // Raíces imaginarias
        double parteReal = -b / (2 * a);
        double parteImag = sqrt(disc.abs()) / (2 * a);
        _tipoSolucion = "Raíces imaginarias (Complejas)";
        _resultado =
            "x1 = ${parteReal.toStringAsFixed(3)} + ${parteImag.toStringAsFixed(3)}i\n"
            "x2 = ${parteReal.toStringAsFixed(3)} - ${parteImag.toStringAsFixed(3)}i";
        _colorEstado = Colors.purple;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ecuación Cuadrática (Ej. 20)"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Text(
              "ax² + bx + c = 0",
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic,
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                _inputCoeficiente(_controllerA, "a"),
                const SizedBox(width: 10),
                _inputCoeficiente(_controllerB, "b"),
                const SizedBox(width: 10),
                _inputCoeficiente(_controllerC, "c"),
              ],
            ),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _resolverCuadratica,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.indigo,
              ),
              child: const Text(
                "Calcular Soluciones",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),

            // Tarjeta de Resultados
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: _colorEstado.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: _colorEstado, width: 2),
              ),
              child: Column(
                children: [
                  Text(
                    _tipoSolucion,
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: _colorEstado,
                    ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    _resultado,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
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

  Widget _inputCoeficiente(TextEditingController controller, String etiqueta) {
    return Expanded(
      child: TextField(
        controller: controller,
        keyboardType: TextInputType.number,
        textAlign: TextAlign.center,
        decoration: InputDecoration(
          labelText: etiqueta,
          border: const OutlineInputBorder(),
        ),
      ),
    );
  }
}
