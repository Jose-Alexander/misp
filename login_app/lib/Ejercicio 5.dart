import 'package:flutter/material.dart';

class Ejercicio5 extends StatefulWidget {
  const Ejercicio5({super.key});

  @override
  State<Ejercicio5> createState() => _Ejercicio5State();
}

class _Ejercicio5State extends State<Ejercicio5> {
  final TextEditingController _tiempoController = TextEditingController();
  String _resultado = "";
  String _error = "";

  void _calcularTiempo() {
    int? tiempo = int.tryParse(_tiempoController.text);

    setState(() {
      _error = "";
      _resultado = "";
    });

    if (tiempo == null) {
      setState(() => _error = "Por favor, ingrese un número entero");
      return;
    }

    // Tu lógica original adaptada
    if (tiempo >= 0) {
      // Cálculo de días (1440 minutos en un día)
      int dias = (tiempo - (tiempo % 60)) ~/ 1440;
      int x = tiempo % 1440;

      // Cálculo de horas
      int horas = (x - (x % 60)) ~/ 60;

      // Minutos restantes
      int minutos = x % 60;

      setState(() {
        _resultado =
            "Equivale a:\n\n"
            "📅 $dias días\n"
            "⏰ $horas horas\n"
            "⏱️ $minutos minutos";
      });
    } else {
      setState(() => _error = "El tiempo no puede ser negativo");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Desglose de Tiempo"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: SingleChildScrollView(
          // Por si el teclado tapa la pantalla
          child: Column(
            children: [
              const Icon(Icons.calendar_month, size: 80, color: Colors.indigo),
              const SizedBox(height: 20),
              const Text(
                "Ingrese el tiempo en minutos:",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 15),
              TextField(
                controller: _tiempoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Minutos totales",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.access_time),
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                onPressed: _calcularTiempo,
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.indigo,
                  foregroundColor: Colors.white,
                ),
                child: const Text("Calcular Desglose"),
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
                  fontSize: 20,
                  color: Colors.black87,
                  height: 1.5,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
