import 'package:flutter/material.dart';

class Ejercicio31 extends StatefulWidget {
  const Ejercicio31({super.key});

  @override
  State<Ejercicio31> createState() => _Ejercicio31State();
}

class _Ejercicio31State extends State<Ejercicio31> {
  int _vole = 0, _fut = 0, _aje = 0, _basq = 0;
  int _contadorAlumnos = 0;
  final int _limiteAlumnos = 10;

  void _registrarDeporte(String deporte) {
    if (_contadorAlumnos >= _limiteAlumnos) return;

    setState(() {
      _contadorAlumnos++;
      switch (deporte) {
        case "voley":
          _vole++;
          break;
        case "futbol":
          _fut++;
          break;
        case "basquet":
          _basq++;
          break;
        case "ajedrez":
          _aje++;
          break;
      }
    });

    if (_contadorAlumnos == _limiteAlumnos) {
      _mostrarResumenFinal();
    }
  }

  void _reiniciar() {
    setState(() {
      _vole = 0;
      _fut = 0;
      _aje = 0;
      _basq = 0;
      _contadorAlumnos = 0;
    });
  }

  void _mostrarResumenFinal() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Encuesta Finalizada"),
        content: Text(
          "Resultados:\n⚽ Fútbol: $_fut\n🏐 Voley: $_vole\n🏀 Básquet: $_basq\n♟️ Ajedrez: $_aje",
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Encuesta Deportiva (Ej. 31)"),
        backgroundColor: Colors.teal,
        foregroundColor: Colors.white,
        actions: [
          IconButton(onPressed: _reiniciar, icon: const Icon(Icons.refresh)),
        ],
      ),
      // SOLUCIÓN: SingleChildScrollView permite que la pantalla se deslice
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              Text(
                "Alumno N° ${_contadorAlumnos < _limiteAlumnos ? _contadorAlumnos + 1 : _limiteAlumnos} de $_limiteAlumnos",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              LinearProgressIndicator(
                value: _contadorAlumnos / _limiteAlumnos,
                backgroundColor: Colors.teal[50],
                color: Colors.teal,
              ),
              const SizedBox(height: 20),
              const Text("Seleccione el deporte favorito:"),
              const SizedBox(height: 15),

              // GridView ajustado para no causar desbordamiento
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                childAspectRatio: 2.0, // Botones más delgados
                children: [
                  _botonDeporte(
                    "Fútbol",
                    Icons.sports_soccer,
                    Colors.green,
                    "futbol",
                  ),
                  _botonDeporte(
                    "Voley",
                    Icons.sports_volleyball,
                    Colors.orange,
                    "voley",
                  ),
                  _botonDeporte(
                    "Básquet",
                    Icons.sports_basketball,
                    Colors.deepOrange,
                    "basquet",
                  ),
                  _botonDeporte(
                    "Ajedrez",
                    Icons.grid_on,
                    Colors.blueGrey,
                    "ajedrez",
                  ),
                ],
              ),

              const SizedBox(height: 30),
              const Text(
                "RESULTADOS ACTUALES",
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              const Divider(),

              _barraResultado("⚽ Fútbol", _fut, Colors.green),
              _barraResultado("🏐 Voley", _vole, Colors.orange),
              _barraResultado("🏀 Básquet", _basq, Colors.deepOrange),
              _barraResultado("♟️ Ajedrez", _aje, Colors.blueGrey),

              const SizedBox(height: 40), // Espacio al final para el scroll
            ],
          ),
        ),
      ),
    );
  }

  Widget _botonDeporte(
    String nombre,
    IconData icono,
    Color color,
    String clave,
  ) {
    return ElevatedButton.icon(
      onPressed: _contadorAlumnos < _limiteAlumnos
          ? () => _registrarDeporte(clave)
          : null,
      icon: Icon(icono, size: 16),
      label: Text(nombre, style: const TextStyle(fontSize: 12)),
      style: ElevatedButton.styleFrom(
        backgroundColor: color,
        foregroundColor: Colors.white,
        padding: EdgeInsets.zero,
      ),
    );
  }

  Widget _barraResultado(String etiqueta, int cantidad, Color color) {
    double porcentaje = _contadorAlumnos > 0 ? (cantidad / _limiteAlumnos) : 0;
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text("$etiqueta ($cantidad)"),
          const SizedBox(height: 5),
          LinearProgressIndicator(
            value: porcentaje,
            backgroundColor: Colors.grey[200],
            color: color,
            minHeight: 10,
          ),
        ],
      ),
    );
  }
}
