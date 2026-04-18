import 'package:flutter/material.dart';

class Ejercicio30 extends StatefulWidget {
  const Ejercicio30({super.key});

  @override
  State<Ejercicio30> createState() => _Ejercicio30State();
}

class _Ejercicio30State extends State<Ejercicio30> {
  final TextEditingController _nota1Controller = TextEditingController();
  final TextEditingController _nota2Controller = TextEditingController();

  String _resultadoPromedio = "";
  String _estadoAlumno = "";
  String _error = "";
  Color _colorEstado = Colors.grey;

  void _calcularPromedio() {
    double? n1 = double.tryParse(_nota1Controller.text);
    double? n2 = double.tryParse(_nota2Controller.text);

    setState(() {
      _error = "";
      _resultadoPromedio = "";
      _estadoAlumno = "";
      _colorEstado = Colors.grey;
    });

    if (n1 == null || n2 == null) {
      setState(() => _error = "Por favor, ingrese ambas notas.");
      return;
    }

    // Tu lógica original: Validación de rango (0-20)
    if (n1 >= 0 && n1 <= 20 && n2 >= 0 && n2 <= 20) {
      double promedio = (n1 + n2) / 2;

      setState(() {
        _resultadoPromedio = "Promedio: ${promedio.toStringAsFixed(2)}";

        // Lógica de aprobación (>= 10.5)
        if (promedio >= 10.5) {
          _estadoAlumno = "ESTADO: APROBADO";
          _colorEstado = Colors.blue;
        } else {
          _estadoAlumno = "ESTADO: DESAPROBADO";
          _colorEstado = Colors.red;
        }
      });
    } else {
      setState(() {
        _error = "ERROR: Las notas deben estar entre 0 y 20.";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sistema de Notas (Ej. 30)"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Icon(Icons.school, size: 80, color: Colors.indigo),
            const SizedBox(height: 20),
            const Text(
              "Ingrese las notas del estudiante",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 25),
            _inputNota(_nota1Controller, "Nota 1"),
            const SizedBox(height: 15),
            _inputNota(_nota2Controller, "Nota 2"),
            const SizedBox(height: 25),
            ElevatedButton(
              onPressed: _calcularPromedio,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.indigo,
              ),
              child: const Text(
                "Calcular Resultado",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 30),

            if (_error.isNotEmpty) _cardError(_error),

            if (_estadoAlumno.isNotEmpty) _cardResultado(),
          ],
        ),
      ),
    );
  }

  Widget _inputNota(TextEditingController controller, String etiqueta) {
    return TextField(
      controller: controller,
      keyboardType: const TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: etiqueta,
        hintText: "0.00 - 20.00",
        border: const OutlineInputBorder(),
        prefixIcon: const Icon(Icons.edit_note),
      ),
    );
  }

  Widget _cardError(String msj) {
    return Container(
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: Colors.red[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child: Text(
        msj,
        style: const TextStyle(color: Colors.red, fontWeight: FontWeight.bold),
      ),
    );
  }

  Widget _cardResultado() {
    return Container(
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
            _resultadoPromedio,
            style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                _colorEstado == Colors.blue ? Icons.check_circle : Icons.cancel,
                color: _colorEstado,
              ),
              const SizedBox(width: 10),
              Text(
                _estadoAlumno,
                style: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                  color: _colorEstado,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
