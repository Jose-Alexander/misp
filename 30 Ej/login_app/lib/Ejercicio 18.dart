import 'package:flutter/material.dart';

class Ejercicio18 extends StatefulWidget {
  const Ejercicio18({super.key});

  @override
  State<Ejercicio18> createState() => _Ejercicio18State();
}

class _Ejercicio18State extends State<Ejercicio18> {
  final TextEditingController _caracterController = TextEditingController();
  String _mensaje = "Ingrese caracteres hasta encontrar una vocal";
  String _vocalEncontrada = "";
  bool _bloqueado = false;

  void _verificarCaracter(String valor) {
    if (_bloqueado || valor.isEmpty) return;

    // Tomamos solo el último caracter ingresado y lo pasamos a minúscula
    String caracter = valor.characters.last.toLowerCase();

    // Tu lógica original: ¿es una vocal?
    if (caracter == "a" ||
        caracter == "e" ||
        caracter == "i" ||
        caracter == "o" ||
        caracter == "u") {
      setState(() {
        _vocalEncontrada = caracter;
        _mensaje = "¡Vocal detectada!";
        _bloqueado = true; // Detenemos el proceso como el x = 0 del bucle
      });
    } else {
      setState(() {
        _mensaje =
            "El caracter '$caracter' no es una vocal. Siga intentando...";
        _caracterController.clear(); // Limpiamos para el siguiente intento
      });
    }
  }

  void _reiniciar() {
    setState(() {
      _caracterController.clear();
      _mensaje = "Ingrese caracteres hasta encontrar una vocal";
      _vocalEncontrada = "";
      _bloqueado = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Buscador de Vocales (Ej. 18)"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(30.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              _bloqueado ? Icons.check_circle : Icons.search,
              size: 80,
              color: _bloqueado ? Colors.green : Colors.indigo,
            ),
            const SizedBox(height: 20),
            Text(
              _mensaje,
              textAlign: TextAlign.center,
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w500),
            ),
            const SizedBox(height: 30),
            if (!_bloqueado)
              TextField(
                controller: _caracterController,
                autofocus: true,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
                decoration: const InputDecoration(
                  hintText: "?",
                  border: OutlineInputBorder(),
                ),
                onChanged: _verificarCaracter, // Se ejecuta en cada pulsación
              )
            else
              Column(
                children: [
                  Text(
                    "La primera vocal ingresada fue: $_vocalEncontrada",
                    style: const TextStyle(
                      fontSize: 22,
                      color: Colors.green,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _reiniciar,
                    icon: const Icon(Icons.refresh),
                    label: const Text("Intentar de nuevo"),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
