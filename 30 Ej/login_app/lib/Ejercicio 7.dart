import 'package:flutter/material.dart';

class Ejercicio7 extends StatefulWidget {
  const Ejercicio7({super.key});

  @override
  State<Ejercicio7> createState() => _Ejercicio7State();
}

class _Ejercicio7State extends State<Ejercicio7> {
  final TextEditingController _horasController = TextEditingController();
  final TextEditingController _tarifaController = TextEditingController();

  // Lista para guardar los salarios calculados
  List<double> _listaSalarios = [];
  double _sumaTotal = 0;

  void _agregarTrabajador() {
    double? horas = double.tryParse(_horasController.text);
    double? tarifa = double.tryParse(_tarifaController.text);

    if (horas == null || tarifa == null) return;

    double salario;
    // Tu lógica original: extras al 50% si horas > 40
    if (horas > 40) {
      double extras = horas - 40;
      salario = (40 * tarifa) + (extras * tarifa * 1.5);
    } else {
      salario = horas * tarifa;
    }

    setState(() {
      _listaSalarios.add(salario);
      _sumaTotal += salario;
      // Limpiar campos para el siguiente trabajador
      _horasController.clear();
      _tarifaController.clear();
    });
  }

  void _reiniciar() {
    setState(() {
      _listaSalarios.clear();
      _sumaTotal = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Planilla de Salarios"),
        backgroundColor: Colors.indigo,
        actions: [
          IconButton(onPressed: _reiniciar, icon: const Icon(Icons.refresh)),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            Text(
              "Trabajador #${_listaSalarios.length + 1}",
              style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: _horasController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Horas trabajadas"),
            ),
            TextField(
              controller: _tarifaController,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(labelText: "Tarifa por hora"),
            ),
            const SizedBox(height: 15),
            ElevatedButton.icon(
              onPressed: _agregarTrabajador,
              icon: const Icon(Icons.add),
              label: const Text("Agregar y Calcular"),
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(double.infinity, 45),
              ),
            ),
            const Divider(height: 30),
            const Text(
              "Historial de esta sesión:",
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _listaSalarios.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: const Icon(Icons.person),
                    title: Text("Trabajador ${index + 1}"),
                    trailing: Text(
                      "\$${_listaSalarios[index].toStringAsFixed(2)}",
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.all(15),
              color: Colors.indigo[50],
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    "SUMA TOTAL:",
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    "\$${_sumaTotal.toStringAsFixed(2)}",
                    style: const TextStyle(
                      fontSize: 20,
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
