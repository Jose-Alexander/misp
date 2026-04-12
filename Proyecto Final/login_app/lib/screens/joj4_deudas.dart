import 'package:flutter/material.dart';

class JOJ4 extends StatefulWidget {
  const JOJ4({super.key});

  @override
  State<JOJ4> createState() => _JOJ4State();
}

class _JOJ4State extends State<JOJ4> {
  // --- ESTADO Y CONTROLADORES ---
  final TextEditingController _montoController = TextEditingController();
  double _balancePendiente = 124500.00;
  final double _progresoPagado = 0.65;

  // Historial basado en image_664ccd.png
  final List<Map<String, String>> _historialPagos = [
    {
      "titulo": "Pago Mensual Septiembre",
      "fecha": "12 SEP 2023",
      "metodo": "TRANSFERENCIA",
      "monto": "12,000",
    },
    {
      "titulo": "Abono a Capital Extra",
      "fecha": "28 AGO 2023",
      "metodo": "EFECTIVO",
      "monto": "5,500",
    },
    {
      "titulo": "Pago Mensual Agosto",
      "fecha": "10 AGO 2023",
      "metodo": "TRANSFERENCIA",
      "monto": "12,000",
    },
  ];

  // --- LÓGICA DE REGISTRO ---
  void _confirmarPago() {
    final double? monto = double.tryParse(_montoController.text);
    if (monto != null && monto > 0) {
      setState(() {
        _balancePendiente -= monto;
        _historialPagos.insert(0, {
          "titulo": "Abono Manual",
          "fecha": "HOY",
          "metodo": "TRANSFERENCIA",
          "monto": monto.toStringAsFixed(0),
        });
        _montoController.clear();
      });
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text("Pago registrado exitosamente")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryColor = Color(0xFF004354); // Azul oscuro de las capturas
    const Color lightBlueBg = Color(
      0xFFF0F9FB,
    ); // Fondo celeste de las tarjetas

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: const Icon(Icons.arrow_back, color: primaryColor),
        title: const Text(
          "Deuda Hipotecaria",
          style: TextStyle(color: primaryColor, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Icon(Icons.edit, color: Colors.grey),
          SizedBox(width: 15),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // --- SECCIÓN BALANCE (image_672a07.png) ---
            const SizedBox(height: 10),
            const Text(
              "BALANCE PENDIENTE",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
                letterSpacing: 1.2,
              ),
            ),
            const SizedBox(height: 5),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Padding(
                  padding: EdgeInsets.only(top: 8),
                  child: Text(
                    "\$",
                    style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.bold,
                      color: primaryColor,
                    ),
                  ),
                ),
                Text(
                  _balancePendiente
                      .toStringAsFixed(0)
                      .replaceAllMapped(
                        RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))'),
                        (Match m) => '${m[1]},',
                      ),
                  style: const TextStyle(
                    fontSize: 45,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: Text(
                    ".00",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.redAccent,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "PRÓXIMO VENCIMIENTO",
                      style: TextStyle(color: Colors.grey, fontSize: 10),
                    ),
                    Text(
                      "15 de Octubre, 2023",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 13,
                      ),
                    ),
                  ],
                ),
                Text(
                  "${(_progresoPagado * 100).toInt()}% Pagado",
                  style: const TextStyle(
                    color: Color(0xFF005662),
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: LinearProgressIndicator(
                value: _progresoPagado,
                backgroundColor: lightBlueBg,
                color: const Color(0xFF005662),
                minHeight: 8,
              ),
            ),

            const SizedBox(height: 30),

            // --- SECCIÓN REGISTRO (image_6739ea.png) ---
            const Text(
              "Registrar Nuevo Pago",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 15),
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: lightBlueBg,
                borderRadius: BorderRadius.circular(15),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "Monto del Pago",
                    style: TextStyle(
                      color: primaryColor,
                      fontSize: 12,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 10),
                  TextField(
                    controller: _montoController,
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.attach_money,
                        size: 20,
                        color: Colors.grey,
                      ),
                      hintText: "0.00",
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton(
                      onPressed: _confirmarPago,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: primaryColor,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(12),
                        ),
                      ),
                      child: const Text(
                        "CONFIRMAR PAGO",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          letterSpacing: 1.1,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 30),

            // --- SECCIÓN HISTORIAL (image_664ccd.png) ---
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Historial de Pagos",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
                ),
                Text(
                  "VER TODO",
                  style: TextStyle(
                    color: Color(0xFF005662),
                    fontSize: 12,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _historialPagos.length,
              itemBuilder: (context, index) {
                final item = _historialPagos[index];
                return Container(
                  margin: const EdgeInsets.only(bottom: 12),
                  padding: const EdgeInsets.all(15),
                  decoration: BoxDecoration(
                    color: lightBlueBg,
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: Row(
                    children: [
                      const CircleAvatar(
                        backgroundColor: Color(0xFF005662),
                        radius: 18,
                        child: Icon(Icons.check, color: Colors.white, size: 18),
                      ),
                      const SizedBox(width: 15),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item["titulo"]!,
                              style: const TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 14,
                              ),
                            ),
                            Text(
                              "${item["fecha"]} • ${item["metodo"]}",
                              style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 11,
                              ),
                            ),
                          ],
                        ),
                      ),
                      Text(
                        "+\$${item["monto"]}",
                        style: const TextStyle(
                          color: Color(0xFF005662),
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                );
              },
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
