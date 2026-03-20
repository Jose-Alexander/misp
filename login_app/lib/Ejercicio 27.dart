import 'package:flutter/material.dart';

class Ejercicio27 extends StatefulWidget {
  const Ejercicio27({super.key});

  @override
  State<Ejercicio27> createState() => _Ejercicio27State();
}

class _Ejercicio27State extends State<Ejercicio27> {
  final TextEditingController _consumoController = TextEditingController();

  double _totalAcumulado = 0;
  int _contador = 0;
  final List<Map<String, dynamic>> _listaConsumos = [];

  void _registrarConsumo() {
    double? consumoOriginal = double.tryParse(_consumoController.text);

    if (consumoOriginal == null || consumoOriginal <= 0) return;

    setState(() {
      _contador++;
      double descuento = 0;

      // Tu lógica original: 15% si excede los $130
      if (consumoOriginal > 130) {
        descuento = consumoOriginal * 0.15;
      }

      double consumoFinal = consumoOriginal - descuento;
      _totalAcumulado += consumoFinal;

      // Guardamos en la lista visual
      _listaConsumos.insert(0, {
        'id': _contador,
        'original': consumoOriginal,
        'descuento': descuento,
        'final': consumoFinal,
      });

      _consumoController.clear();
    });

    // Si llega a 130, avisamos que se completó el lote
    if (_contador == 130) {
      _mostrarAlertaFinal();
    }
  }

  void _mostrarAlertaFinal() {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Límite Alcanzado"),
        content: Text(
          "Se han registrado los 130 consumos.\nTotal: \$${_totalAcumulado.toStringAsFixed(2)}",
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
        title: const Text("Caja de Restaurante (Ej. 27)"),
        backgroundColor: Colors.orange,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Resumen del Total
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.orange[50],
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: Colors.orange),
              ),
              child: Column(
                children: [
                  Text(
                    "TOTAL ACUMULADO ($_contador/130)",
                    style: const TextStyle(
                      color: Colors.orange,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$${_totalAcumulado.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange,
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _consumoController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      labelText: "Monto del Consumo",
                      prefixText: "\$ ",
                      border: OutlineInputBorder(),
                    ),
                    onSubmitted: (_) => _registrarConsumo(),
                  ),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _contador < 130 ? _registrarConsumo : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.orange,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 20),
                  ),
                  child: const Icon(Icons.add_shopping_cart),
                ),
              ],
            ),
            const Divider(height: 40),
            const Text(
              "HISTORIAL DE CONSUMOS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _listaConsumos.length,
                itemBuilder: (context, index) {
                  final item = _listaConsumos[index];
                  return Card(
                    child: ListTile(
                      leading: CircleAvatar(child: Text("${item['id']}")),
                      title: Text(
                        "Neto: \$${item['final'].toStringAsFixed(2)}",
                      ),
                      subtitle: Text(
                        "Original: \$${item['original']} | Desc: -\$${item['descuento'].toStringAsFixed(2)}",
                      ),
                      trailing: item['descuento'] > 0
                          ? const Icon(Icons.star, color: Colors.amber)
                          : null,
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
