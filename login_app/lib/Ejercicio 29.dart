import 'package:flutter/material.dart';

class Ejercicio29 extends StatefulWidget {
  const Ejercicio29({super.key});

  @override
  State<Ejercicio29> createState() => _Ejercicio29State();
}

class _Ejercicio29State extends State<Ejercicio29> {
  final TextEditingController _egresoController = TextEditingController();

  // Variables iniciales según tu ejercicio
  double _caja = 3.71;
  double _totalEgresos = 0;
  int _contador = 0;
  bool _procesoFinalizado = false;
  final List<Map<String, dynamic>> _historial = [];

  void _registrarEgreso() {
    double? monto = double.tryParse(_egresoController.text);

    if (monto == null) return;

    // Lógica del centinela (-1 para terminar)
    if (monto == -1) {
      setState(() {
        _procesoFinalizado = true;
      });
      _egresoController.clear();
      return;
    }

    setState(() {
      _contador++;
      _totalEgresos += monto;
      _caja -= monto; // Restamos del saldo de caja

      _historial.insert(0, {
        'id': _contador,
        'monto': monto,
        'saldo_restante': _caja,
      });

      _egresoController.clear();
    });
  }

  void _reiniciar() {
    setState(() {
      _caja = 3.71;
      _totalEgresos = 0;
      _contador = 0;
      _procesoFinalizado = false;
      _historial.clear();
    });
  }

  @override
  Widget build(BuildContext context) {
    // Determinar color según el estado de la caja
    Color colorCaja = _caja >= 0 ? Colors.green : Colors.red;

    return Scaffold(
      appBar: AppBar(
        title: const Text("Control de Egresos Barner"),
        backgroundColor: Colors.blueGrey[800],
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            // Panel de Saldo Actual
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: colorCaja.withOpacity(0.1),
                borderRadius: BorderRadius.circular(15),
                border: Border.all(color: colorCaja, width: 2),
              ),
              child: Column(
                children: [
                  const Text(
                    "SALDO ACTUAL EN CAJA",
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                  ),
                  Text(
                    "\$${_caja.toStringAsFixed(2)}",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: colorCaja,
                    ),
                  ),
                  Text(
                    "Total Egresos: \$${_totalEgresos.toStringAsFixed(2)}",
                    style: const TextStyle(color: Colors.blueGrey),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 25),

            if (!_procesoFinalizado) ...[
              TextField(
                controller: _egresoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(
                  labelText: "Monto del Egreso",
                  hintText: "Ingrese -1 para finalizar",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.money_off),
                ),
                onSubmitted: (_) => _registrarEgreso(),
              ),
              const SizedBox(height: 15),
              ElevatedButton.icon(
                onPressed: _registrarEgreso,
                icon: const Icon(Icons.add_circle_outline),
                label: const Text("Registrar Gasto"),
                style: ElevatedButton.styleFrom(
                  minimumSize: const Size(double.infinity, 50),
                  backgroundColor: Colors.blueGrey[800],
                  foregroundColor: Colors.white,
                ),
              ),
            ] else
              _panelFinalizacion(),

            const Divider(height: 40),
            const Text(
              "HISTORIAL DE MOVIMIENTOS",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            Expanded(
              child: ListView.builder(
                itemCount: _historial.length,
                itemBuilder: (context, index) {
                  final item = _historial[index];
                  return ListTile(
                    leading: CircleAvatar(child: Text("${item['id']}")),
                    title: Text(
                      "Egreso: -\$${item['monto'].toStringAsFixed(2)}",
                    ),
                    subtitle: Text(
                      "Saldo tras operación: \$${item['saldo_restante'].toStringAsFixed(2)}",
                    ),
                    trailing: const Icon(
                      Icons.arrow_downward,
                      color: Colors.red,
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

  Widget _panelFinalizacion() {
    return Column(
      children: [
        const Text(
          "PROCESO FINALIZADO",
          style: TextStyle(
            color: Colors.red,
            fontWeight: FontWeight.bold,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        ElevatedButton(
          onPressed: _reiniciar,
          child: const Text("Reiniciar Caja (\$3.71)"),
        ),
      ],
    );
  }
}
