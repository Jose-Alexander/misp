import 'package:flutter/material.dart';

class JOJ5 extends StatefulWidget {
  const JOJ5({super.key});

  @override
  State<JOJ5> createState() => _JOJ5State();
}

class _JOJ5State extends State<JOJ5> {
  // VARIABLES DE ESTADO (Para que los números cambien de verdad)
  double balance = 4250.00;
  double ingresosTotales = 7000.00;
  double gastosTotales = 2750.00;

  // LISTA DE INTERACCIONES (Para mostrar lo que vas colocando)
  List<Map<String, dynamic>> historial = [];

  void _registrarMovimiento(String concepto, double monto, bool esIngreso) {
    setState(() {
      if (esIngreso) {
        ingresosTotales += monto;
        balance += monto;
        historial.insert(0, {
          "titulo": concepto,
          "monto": monto,
          "tipo": "ingreso",
        });
      } else {
        gastosTotales += monto;
        balance -= monto;
        historial.insert(0, {
          "titulo": concepto,
          "monto": monto,
          "tipo": "gasto",
        });
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    const Color primaryDark = Color(0xFF004354); // Azul oscuro
    const Color accentLight = Color(0xFF98E9EE); // Celeste

    return Scaffold(
      backgroundColor: const Color(0xFFF8FCFF),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 60),
            const Text(
              "GESTIÓN DE PRESUPUESTO",
              style: TextStyle(
                color: Colors.grey,
                fontSize: 11,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Mayo 2024",
              style: TextStyle(
                fontSize: 28,
                fontWeight: FontWeight.bold,
                color: primaryDark,
              ),
            ),

            const SizedBox(height: 20),

            // TARJETA DE BALANCE (Se actualiza sola)
            _buildBalanceCard(primaryDark),

            const SizedBox(height: 30),
            _buildSectionHeader("Comparativa", "29% usado"),

            _buildProgressItem(
              "Vivienda",
              1200,
              1200,
              1.0,
              Icons.home,
              primaryDark,
            ),
            _buildProgressItem(
              "Alimentación",
              350,
              600,
              0.58,
              Icons.restaurant,
              primaryDark,
            ),

            const SizedBox(height: 25),

            // BOTONES FUNCIONALES
            Row(
              children: [
                _buildActionBtn(
                  "NUEVO GASTO",
                  Icons.add_circle,
                  primaryDark,
                  Colors.white,
                  () {
                    _abrirFormulario(
                      context,
                      "Nuevo Gasto",
                      Colors.redAccent,
                      false,
                    );
                  },
                ),
                const SizedBox(width: 15),
                _buildActionBtn(
                  "INGRESO",
                  Icons.payments,
                  accentLight,
                  primaryDark,
                  () {
                    _abrirFormulario(
                      context,
                      "Nuevo Ingreso",
                      Colors.teal,
                      true,
                    );
                  },
                ),
              ],
            ),

            const SizedBox(height: 30),
            if (historial.isNotEmpty) ...[
              const Text(
                "MOVIMIENTOS RECIENTES",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: 11,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              ...historial.map((mov) => _buildMovimientoTile(mov)),
            ],

            const SizedBox(height: 40),
          ],
        ),
      ),
    );
  }

  // --- FORMULARIO PARA COLOCAR DATOS ---
  void _abrirFormulario(
    BuildContext context,
    String titulo,
    Color color,
    bool esIngreso,
  ) {
    TextEditingController conceptoCtrl = TextEditingController();
    TextEditingController montoCtrl = TextEditingController();

    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
      ),
      builder: (context) => Padding(
        padding: EdgeInsets.only(
          bottom: MediaQuery.of(context).viewInsets.bottom,
          left: 20,
          right: 20,
          top: 20,
        ),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              titulo,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            TextField(
              controller: conceptoCtrl,
              decoration: const InputDecoration(
                labelText: "Concepto (ej. Supermercado)",
              ),
            ),
            TextField(
              controller: montoCtrl,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: "Monto",
                prefixText: "\$",
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: color,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                _registrarMovimiento(
                  conceptoCtrl.text,
                  double.tryParse(montoCtrl.text) ?? 0,
                  esIngreso,
                );
                Navigator.pop(context);
              },
              child: const Text(
                "GUARDAR",
                style: TextStyle(color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }

  // --- COMPONENTES VISUALES ---
  Widget _buildBalanceCard(Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "TU BALANCE DISPONIBLE",
            style: TextStyle(color: Colors.grey, fontSize: 11),
          ),
          Text(
            "\$${balance.toStringAsFixed(2)}",
            style: TextStyle(
              fontSize: 34,
              fontWeight: FontWeight.bold,
              color: color,
            ),
          ),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              _colDato(
                "INGRESOS",
                "\$${ingresosTotales.toStringAsFixed(0)}",
                Colors.teal,
              ),
              _colDato(
                "GASTOS",
                "\$${gastosTotales.toStringAsFixed(0)}",
                Colors.redAccent,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _colDato(String l, String v, Color c) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "↑ $l",
          style: TextStyle(color: c, fontSize: 10, fontWeight: FontWeight.bold),
        ),
        Text(
          v,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
      ],
    );
  }

  Widget _buildMovimientoTile(Map<String, dynamic> mov) {
    bool isIng = mov['tipo'] == "ingreso";
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.grey.shade100),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Icon(
                isIng ? Icons.add_circle : Icons.remove_circle,
                color: isIng ? Colors.teal : Colors.redAccent,
                size: 20,
              ),
              const SizedBox(width: 10),
              Text(
                mov['titulo'],
                style: const TextStyle(fontWeight: FontWeight.w500),
              ),
            ],
          ),
          Text(
            "${isIng ? '+' : '-'} \$${mov['monto']}",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isIng ? Colors.teal : Colors.redAccent,
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildActionBtn(
    String t,
    IconData i,
    Color bg,
    Color c,
    VoidCallback tap,
  ) {
    return Expanded(
      child: Material(
        color: bg,
        borderRadius: BorderRadius.circular(12),
        child: InkWell(
          onTap: tap,
          borderRadius: BorderRadius.circular(12),
          child: Container(
            height: 55,
            alignment: Alignment.center,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(i, color: c, size: 18),
                const SizedBox(width: 8),
                Text(
                  t,
                  style: TextStyle(
                    color: c,
                    fontWeight: FontWeight.bold,
                    fontSize: 11,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildProgressItem(
    String label,
    double cur,
    double max,
    double val,
    IconData icon,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 15),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFF0F9FF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon, size: 18, color: color),
                  const SizedBox(width: 8),
                  Text(
                    label,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Text(
                "\$$cur / \$$max",
                style: const TextStyle(color: Colors.grey, fontSize: 11),
              ),
            ],
          ),
          const SizedBox(height: 10),
          LinearProgressIndicator(
            value: val,
            backgroundColor: Colors.white,
            color: color,
            minHeight: 7,
            borderRadius: BorderRadius.circular(5),
          ),
        ],
      ),
    );
  }

  Widget _buildSectionHeader(String t, String a) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(t, style: const TextStyle(fontSize: 16, color: Colors.grey)),
          Text(
            a,
            style: const TextStyle(
              color: Color(0xFF004354),
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
          ),
        ],
      ),
    );
  }
}
