import 'package:flutter/material.dart';

class Ejercicio10 extends StatefulWidget {
  const Ejercicio10({super.key});

  @override
  State<Ejercicio10> createState() => _Ejercicio10State();
}

class _Ejercicio10State extends State<Ejercicio10> {
  final TextEditingController _numeroController = TextEditingController();
  String _resultado = "";
  String _proceso = "";

  void _sumarDigitos() {
    // Tomamos el valor actual del input
    String inputOriginal = _numeroController.text;
    int? numero = int.tryParse(inputOriginal);

    if (numero == null || numero < 0) {
      setState(() {
        _resultado = "Error";
        _proceso = "Por favor, ingrese un número entero positivo";
      });
      return;
    }

    int suma = 0;
    int residuo;
    int n = numero;
    String pasos = "";

    // Tu lógica original (Bucle do-while)
    do {
      residuo = n % 10;
      suma = suma + residuo;

      pasos += "Dígito extraído: $residuo\n";

      // División entera
      n = (n - (n % 10)) ~/ 10;
    } while (n != 0);

    setState(() {
      _proceso = pasos;
      _resultado = "La suma de los dígitos de $inputOriginal es: $suma";
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Suma de Dígitos (Ej. 10)"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          children: [
            const Icon(
              Icons.calculate_outlined,
              size: 80,
              color: Colors.indigo,
            ),
            const SizedBox(height: 20),
            TextField(
              controller: _numeroController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Ingrese un número entero",
                border: OutlineInputBorder(),
                prefixIcon: Icon(Icons.pin),
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _sumarDigitos,
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 50),
                backgroundColor: Colors.indigo,
                foregroundColor: Colors.white,
              ),
              child: const Text("Sumar Dígitos"),
            ),
            const SizedBox(height: 30),
            if (_proceso.isNotEmpty)
              Container(
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: Colors.grey[100],
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: Colors.indigo.withOpacity(0.2)),
                ),
                child: Column(
                  children: [
                    Text(
                      _proceso,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontFamily: 'monospace',
                        fontSize: 16,
                      ),
                    ),
                    const Divider(),
                    Text(
                      _resultado,
                      textAlign: TextAlign.center,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo,
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
}
