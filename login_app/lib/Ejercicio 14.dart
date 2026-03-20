import 'package:flutter/material.dart';

class Ejercicio14 extends StatefulWidget {
  const Ejercicio14({super.key});

  @override
  State<Ejercicio14> createState() => _Ejercicio14State();
}

class _Ejercicio14State extends State<Ejercicio14> {
  final TextEditingController _numeroController = TextEditingController();

  double _sumaTotal = 0;
  int _contador = 0;
  double _media = 0;
  List<double> _historial = [];

  void _agregarNumero() {
    double? numero = double.tryParse(_numeroController.text);

    if (numero == null) return;

    setState(() {
      _contador++;
      _sumaTotal += numero;
      _media = _sumaTotal / _contador;
      _historial.insert(0, numero); // Guardar para mostrar en lista
      _numeroController.clear();
    });

    // Opcional: Detener al llegar a 100 como en tu lógica original
    if (_contador == 100) {
      _mostrarDialogoFinal();
    }
  }

  void _mostrarDialogoFinal() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("¡Meta alcanzada!"),
        content: Text(
          "Has ingresado 100 números.\nLa media final es: ${_media.toStringAsFixed(2)}",
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  void _reiniciar() {
    setState(() {
      _sumaTotal = 0;
      _contador = 0;
      _media = 0;
      _historial.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Cálculo de Media (Ej. 14)"),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(onPressed: _reiniciar, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            LinearProgressIndicator(
              value: _contador / 100,
              backgroundColor: Colors.grey[300],
              color: Colors.indigo,
            ),
            const SizedBox(height: 10),
            Text(
              "Progreso: $_contador / 100 números",
              style: const TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _numeroController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Ingrese número",
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _agregarNumero(),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _agregarNumero,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.indigo,
                    foregroundColor: Colors.white,
                  ),
                  child: const Text("Añadir"),
                ),
              ],
            ),
            const SizedBox(height: 30),
            _resumenMedia(),
            const Divider(height: 40),
            const Text("Últimos números añadidos:"),
            Expanded(
              child: ListView.builder(
                itemCount: _historial.length,
                itemBuilder: (context, index) => ListTile(
                  leading: const Icon(Icons.numbers),
                  title: Text("Número: ${_historial[index]}"),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _resumenMedia() {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.indigo[50],
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Text(
            "MEDIA ACTUAL",
            style: TextStyle(color: Colors.indigo[700], letterSpacing: 1.2),
          ),
          Text(
            _media.toStringAsFixed(2),
            style: const TextStyle(
              fontSize: 48,
              fontWeight: FontWeight.bold,
              color: Colors.indigo,
            ),
          ),
          Text(
            "Suma total: ${_sumaTotal.toStringAsFixed(2)}",
            style: const TextStyle(color: Colors.black54),
          ),
        ],
      ),
    );
  }
}
