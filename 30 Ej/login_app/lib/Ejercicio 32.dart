import 'package:flutter/material.dart';

class Ejercicio32 extends StatefulWidget {
  const Ejercicio32({super.key});

  @override
  State<Ejercicio32> createState() => _Ejercicio32State();
}

class _Ejercicio32State extends State<Ejercicio32> {
  final List<TextEditingController> _controllers = List.generate(
    5,
    (_) => TextEditingController(),
  );
  final List<String> _clavesCorrectas = [
    "tienes",
    "que ser",
    "invitado",
    "para",
    "ingresar",
  ];

  int _nivelActual = 0; // Controla qué input se muestra
  bool _accesoConcedido = false;
  String _mensajeError = "";

  void _verificarClave(String valor) {
    setState(() {
      _mensajeError = "";
      // Limpiamos espacios y pasamos a minúsculas para evitar errores tontos
      if (valor.trim().toLowerCase() == _clavesCorrectas[_nivelActual]) {
        if (_nivelActual < 4) {
          _nivelActual++; // Siguiente nivel
        } else {
          _accesoConcedido = true; // Éxito total
        }
      } else {
        _mensajeError = "TE EQUIVOCASTE DE FIESTA";
        _nivelActual = 0; // Reiniciamos por seguridad como un sistema real
        for (var c in _controllers) {
          c.clear();
        }
      }
    });
  }

  void _reiniciar() {
    setState(() {
      _nivelActual = 0;
      _accesoConcedido = false;
      _mensajeError = "";
      for (var c in _controllers) {
        c.clear();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: _accesoConcedido ? Colors.purple[900] : Colors.grey[100],
      appBar: AppBar(
        title: const Text("Control de Acceso VIP"),
        backgroundColor: Colors.black87,
        foregroundColor: Colors.white,
      ),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(30.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              if (!_accesoConcedido) ...[
                const Icon(Icons.lock_person, size: 80, color: Colors.black87),
                const SizedBox(height: 20),
                Text(
                  "NIVEL DE SEGURIDAD: ${_nivelActual + 1} / 5",
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    letterSpacing: 2,
                  ),
                ),
                const SizedBox(height: 30),

                // Campo de texto dinámico
                TextField(
                  controller: _controllers[_nivelActual],
                  onSubmitted: _verificarClave,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    hintText: "Ingrese la clave ${_nivelActual + 1}",
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ElevatedButton(
                  onPressed: () =>
                      _verificarClave(_controllers[_nivelActual].text),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.black87,
                  ),
                  child: const Text(
                    "VERIFICAR",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                if (_mensajeError.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      _mensajeError,
                      style: const TextStyle(
                        color: Colors.red,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
              ] else ...[
                // Pantalla de Éxito
                const Icon(Icons.celebration, size: 100, color: Colors.amber),
                const SizedBox(height: 20),
                const Text(
                  "¡BIENVENIDO A LA FIESTA!",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 30),
                ElevatedButton(
                  onPressed: _reiniciar,
                  child: const Text("SALIR DE LA FIESTA"),
                ),
              ],
            ],
          ),
        ),
      ),
    );
  }
}
