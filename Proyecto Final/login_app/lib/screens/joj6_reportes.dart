import 'package:flutter/material.dart';

class JOJ6 extends StatelessWidget {
  const JOJ6({super.key});

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
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "ANÁLISIS FINANCIERO",
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 11,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      "Reportes",
                      style: TextStyle(
                        fontSize: 32,
                        fontWeight: FontWeight.bold,
                        color: primaryDark,
                      ),
                    ),
                  ],
                ),
                ElevatedButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.download,
                    size: 18,
                    color: Colors.white,
                  ),
                  label: const Text(
                    "Exportar",
                    style: TextStyle(color: Colors.white),
                  ),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: primaryDark,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 25),

            // TENDENCIA DE PAGOS
            _buildCardWrapper(
              child: Column(
                children: [
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Tendencia de Pagos",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          Text(
                            "DEUDA VS ABONOS",
                            style: TextStyle(color: Colors.grey, fontSize: 10),
                          ),
                        ],
                      ),
                      Text(
                        "+12.4%",
                        style: TextStyle(
                          color: Colors.teal,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      _buildBar(40, "ENE"),
                      _buildBar(60, "FEB"),
                      _buildBar(50, "MAR", active: true),
                      _buildBar(80, "ABR"),
                      _buildBar(90, "MAY", active: true),
                      _buildBar(45, "JUN"),
                    ],
                  ),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // DISTRIBUCIÓN DE DEUDA
            _buildCardWrapper(
              color: const Color(0xFFE3F2FD),
              child: Column(
                children: [
                  const Text(
                    "DISTRIBUCIÓN DE DEUDA",
                    style: TextStyle(
                      fontSize: 11,
                      fontWeight: FontWeight.bold,
                      color: primaryDark,
                    ),
                  ),
                  const SizedBox(height: 20),
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        width: 120,
                        height: 120,
                        child: CircularProgressIndicator(
                          value: 0.7,
                          strokeWidth: 15,
                          backgroundColor: Colors.white,
                          color: Colors.red.shade900,
                        ),
                      ),
                      const Text(
                        "70%",
                        style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                  _rowDeuda("Hipotecario", "\$45,000", Colors.red.shade900),
                  _rowDeuda("Consumo", "\$12,400", Colors.teal),
                ],
              ),
            ),

            const SizedBox(height: 20),

            // RESUMEN EJECUTIVO
            _buildResumenEjecutivo(primaryDark),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }

  Widget _buildCardWrapper({
    required Widget child,
    Color color = Colors.white,
  }) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(color: Colors.black.withOpacity(0.02), blurRadius: 10),
        ],
      ),
      child: child,
    );
  }

  Widget _buildBar(double h, String label, {bool active = false}) {
    return Column(
      children: [
        Container(
          width: 28,
          height: h,
          decoration: BoxDecoration(
            color: active ? const Color(0xFF004354) : const Color(0xFFD1E9F6),
            borderRadius: BorderRadius.circular(4),
          ),
        ),
        const SizedBox(height: 8),
        Text(label, style: const TextStyle(fontSize: 10, color: Colors.grey)),
      ],
    );
  }

  Widget _rowDeuda(String label, String monto, Color color) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              CircleAvatar(radius: 5, backgroundColor: color),
              const SizedBox(width: 10),
              Text(label),
            ],
          ),
          Text(monto, style: const TextStyle(fontWeight: FontWeight.bold)),
        ],
      ),
    );
  }

  Widget _buildResumenEjecutivo(Color color) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(15),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            "Resumen Ejecutivo",
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            "Tu salud financiera ha mejorado un 8% este trimestre.",
            style: TextStyle(
              color: Colors.white.withOpacity(0.8),
              fontSize: 13,
            ),
          ),
          const SizedBox(height: 20),
          Row(
            children: [
              _btnReporte(Icons.picture_as_pdf, "PDF"),
              const SizedBox(width: 15),
              _btnReporte(Icons.table_chart, "EXCEL"),
            ],
          ),
        ],
      ),
    );
  }

  Widget _btnReporte(IconData icon, String label) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white24),
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Icon(icon, color: Colors.white),
            const SizedBox(height: 5),
            Text(
              label,
              style: const TextStyle(color: Colors.white, fontSize: 10),
            ),
          ],
        ),
      ),
    );
  }
}
