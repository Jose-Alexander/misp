import 'package:flutter/material.dart';

class Ejercicio15 extends StatelessWidget {
  const Ejercicio15({super.key});

  @override
  Widget build(BuildContext context) {
    // 1. Lógica del ejercicio (se ejecuta al construir la pantalla)
    int suma = 0;
    int producto = 1;
    List<int> numerosProcesados = [];

    // Bucle original: del 20 al 30 de 2 en 2
    for (int x = 20; x <= 30; x = x + 2) {
      suma = suma + x;
      producto = producto * x;
      numerosProcesados.add(x);
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text("Suma y Producto (Ej. 15)"),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(25.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Icon(Icons.calculate, size: 80, color: Colors.indigo),
            const SizedBox(height: 20),
            const Text(
              "Rango: Números pares del 20 al 30",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Text(
              "Números incluidos: ${numerosProcesados.join(', ')}",
              style: const TextStyle(fontSize: 16, color: Colors.grey),
            ),
            const SizedBox(height: 40),

            // Tarjeta de Suma
            _resultadoCard("La Suma es:", suma.toString(), Colors.blue),

            const SizedBox(height: 20),

            // Tarjeta de Producto
            _resultadoCard(
              "El Producto es:",
              producto.toString(),
              Colors.orange,
            ),

            const Spacer(),
            const Text(
              "Este cálculo es automático al abrir la pantalla.",
              style: TextStyle(fontStyle: FontStyle.italic, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _resultadoCard(String titulo, String valor, Color color) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color.withOpacity(0.1),
        borderRadius: BorderRadius.circular(15),
        border: Border.all(color: color.withOpacity(0.5)),
      ),
      child: Column(
        children: [
          Text(
            titulo,
            style: TextStyle(
              fontSize: 16,
              color: color,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            valor,
            style: TextStyle(
              fontSize: 28,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
        ],
      ),
    );
  }
}
