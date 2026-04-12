import 'package:flutter/material.dart';
import 'joj4_deudas.dart'; // Importante para la navegación

class JOJ3 extends StatelessWidget {
  const JOJ3({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryDark = Color(0xFF004354);

    return Scaffold(
      backgroundColor: const Color(0xFFF8FCFF),
      appBar: AppBar(
        backgroundColor: const Color(0xFFF8FCFF),
        elevation: 0,
        leading: const Icon(
          Icons.account_balance,
          color: primaryDark,
          size: 28,
        ),
        title: const Text(
          "JOJ",
          style: TextStyle(color: primaryDark, fontWeight: FontWeight.bold),
        ),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 15),
            child: CircleAvatar(
              backgroundImage: NetworkImage('https://i.pravatar.cc/150?img=33'),
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 10),
            const Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Resumen Financiero",
                  style: TextStyle(color: Colors.grey, fontSize: 16),
                ),
                Text(
                  "Octubre 2023",
                  style: TextStyle(
                    color: primaryDark,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),

            // TARJETA DE BALANCE
            _buildBalanceCard(primaryDark),

            const SizedBox(height: 30),

            // BOTONES DE ACCIÓN
            Row(
              children: [
                _buildActionBtn(
                  Icons.add,
                  "Transferir",
                  primaryDark,
                  Colors.white,
                  true,
                ),
                const SizedBox(width: 12),
                _buildActionBtn(
                  Icons.qr_code_scanner,
                  "Pagar QR",
                  const Color(0xFFD6E9F5),
                  primaryDark,
                  true,
                ),
                const SizedBox(width: 12),
                _buildActionBtn(
                  Icons.savings,
                  "",
                  const Color(0xFFE9F5FF),
                  primaryDark,
                  false,
                ),
              ],
            ),

            const SizedBox(height: 30),
            const Text(
              "Deudas Pendientes",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 15),

            // LISTA CON NAVEGACIÓN
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const JOJ4()),
              ),
              child: _buildDeudaItem(
                Icons.bolt,
                "Servicios: Electricidad",
                "VENCE MAÑANA",
                "-\$120.50",
                "Pendiente",
                Colors.red.shade50,
              ),
            ),
            _buildDeudaItem(
              Icons.apartment,
              "Alquiler Octubre",
              "VENCE EN 5 DÍAS",
              "\$1,200.00",
              "Programado",
              Colors.blue.shade50,
            ),

            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  // WIDGETS INTERNOS PARA MANTENER EL DISEÑO
  Widget _buildBalanceCard(Color color) {
    return Container(
      padding: const EdgeInsets.all(25),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 15),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "TU BALANCE DISPONIBLE",
            style: TextStyle(
              color: Colors.grey,
              fontSize: 12,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            crossAxisAlignment: CrossAxisAlignment.baseline,
            textBaseline: TextBaseline.alphabetic,
            children: [
              Text(
                "\$12,450",
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: color,
                ),
              ),
              const Text(
                " .80",
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.teal,
                ),
              ),
            ],
          ),
          const SizedBox(height: 25),
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "↑ INGRESOS",
                    style: TextStyle(
                      color: Colors.teal,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$4,200",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Text(
                    "↓ GASTOS",
                    style: TextStyle(
                      color: Colors.redAccent,
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    "\$1,850",
                    style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildActionBtn(
    IconData icon,
    String label,
    Color bg,
    Color text,
    bool large,
  ) {
    return Expanded(
      flex: large ? 2 : 1,
      child: Container(
        height: 60,
        decoration: BoxDecoration(
          color: bg,
          borderRadius: BorderRadius.circular(12),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, color: text),
            if (label.isNotEmpty)
              Padding(
                padding: const EdgeInsets.only(left: 8),
                child: Text(
                  label,
                  style: TextStyle(color: text, fontWeight: FontWeight.bold),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildDeudaItem(
    IconData icon,
    String t,
    String s,
    String a,
    String st,
    Color bg,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 12),
      padding: const EdgeInsets.all(15),
      decoration: BoxDecoration(
        color: const Color(0xFFEDF7FF),
        borderRadius: BorderRadius.circular(15),
      ),
      child: Row(
        children: [
          Container(
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: bg,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Icon(icon, color: const Color(0xFF004354)),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(t, style: const TextStyle(fontWeight: FontWeight.bold)),
                Text(
                  s,
                  style: const TextStyle(color: Colors.grey, fontSize: 11),
                ),
              ],
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(a, style: const TextStyle(fontWeight: FontWeight.bold)),
              Text(
                st,
                style: const TextStyle(color: Colors.grey, fontSize: 11),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
