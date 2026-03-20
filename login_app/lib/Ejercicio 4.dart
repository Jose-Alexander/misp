import 'package:flutter/material.dart';

class Ejercicio4 extends StatefulWidget {
  const Ejercicio4({super.key});

  @override
  State<Ejercicio4> createState() => _Ejercicio4State();
}

class _Ejercicio4State extends State<Ejercicio4> {
  final TextEditingController _segundosController = TextEditingController();
  String _resultado = "";
  String _error = "";

  void _convertirTiempo() {
    int? tiempoSegundos = int.tryParse(_segundosController.text);

    setState(() {
      _error = "";
      _resultado = "";
    });

    if (tiempoSegundos == null) {
      setState(() => _error = "Por favor, ingrese un número entero");
      return;
    }

    // Tu lógica original adaptada a la interfaz
    if (tiempoSegundos < 60 && tiempoSegundos > 0) {
      int segundosRestantes = 60 - tiempoSegundos;
      setState(
        () => _resultado =
            "Le faltan $segundosRestantes segundos para convertirse en 1 minuto",
      );
    } else if (tiempoSegundos >= 60) {
      int minutos = (tiempoSegundos - (tiempoSegundos % 60)) ~/ 60;
      int segundosRestantes = tiempoSegundos % 60;

      setState(
        () => _resultado =
            "Equivale a $minutos minutos.\nFaltan $segundosRestantes segundos para el siguiente minuto.",
      );
    } else {
      setState(() => _error = "La cantidad debe ser un número positivo");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Conversor de Segundos"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Icon(Icons.timer, size: 80, color: Colors.indigo),
            const SizedBox(height: 20),
            const Text(
              "Ingrese el tiempo en segundos:",
              style: TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 15),
            TextField(
              controller: _segundosController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Segundos",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.more_time),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _convertirTiempo,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              child: const Text("Calcular Conversión"),
            ),
            const SizedBox(height: 30),
            if (_error.isNotEmpty)
              Text(
                _error,
                style: const TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.bold,
                ),
              ),
            Text(
              _resultado,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black87,
                fontWeight: FontWeight.w500,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
