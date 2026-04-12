import 'package:flutter/material.dart';

class JOJ7 extends StatelessWidget {
  final String nombre; // Recibe el nombre real del login

  const JOJ7({super.key, required this.nombre});

  @override
  Widget build(BuildContext context) {
    const Color primaryDark = Color(0xFF004354);

    // Simulación de datos reales (puedes conectarlos a tus variables de deudas luego)
    const String correoSimulado = "usuario@joj-systems.com";
    const int totalDeudas = 4;
    const String ultimaActividad = "Pago Hipotecario";

    return Scaffold(
      backgroundColor: const Color(0xFFF8FCFF),
      body: SingleChildScrollView(
        child: Column(
          children: [
            // --- CABECERA DINÁMICA ---
            Container(
              padding: const EdgeInsets.only(
                top: 60,
                bottom: 40,
                left: 20,
                right: 20,
              ),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(40),
                  bottomRight: Radius.circular(40),
                ),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 10)],
              ),
              child: Column(
                children: [
                  const CircleAvatar(
                    radius: 50,
                    backgroundColor: primaryDark,
                    child: Icon(Icons.person, size: 50, color: Colors.white),
                  ),
                  const SizedBox(height: 15),
                  // Muestra el nombre real ingresado
                  Text(
                    nombre.toUpperCase(),
                    style: const TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: primaryDark,
                    ),
                  ),
                  Text(
                    correoSimulado,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.all(25),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    "ESTADÍSTICAS REALES",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      letterSpacing: 1.1,
                    ),
                  ),
                  const SizedBox(height: 15),

                  // Fila de tarjetas con datos "reales"
                  Row(
                    children: [
                      _buildInfoCard(
                        "Deudas Activas",
                        "$totalDeudas",
                        Icons.account_balance_wallet,
                        Colors.orange,
                      ),
                      const SizedBox(width: 15),
                      _buildInfoCard(
                        "Último Mov.",
                        ultimaActividad,
                        Icons.history,
                        Colors.blue,
                      ),
                    ],
                  ),

                  const SizedBox(height: 30),
                  const Text(
                    "DETALLES DE CUENTA",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      color: Colors.grey,
                      letterSpacing: 1.1,
                    ),
                  ),
                  const SizedBox(height: 10),

                  // Opciones funcionales
                  _buildListOption(
                    Icons.verified_user,
                    "Estado de cuenta",
                    "Verificado",
                    primaryDark,
                  ),
                  _buildListOption(
                    Icons.language,
                    "Idioma",
                    "Español",
                    primaryDark,
                  ),
                  _buildListOption(
                    Icons.lock_clock,
                    "Último acceso",
                    "Hoy, 10:45 AM",
                    primaryDark,
                  ),

                  const SizedBox(height: 40),

                  // Botón de Cerrar Sesión Funcional
                  SizedBox(
                    width: double.infinity,
                    height: 55,
                    child: ElevatedButton.icon(
                      onPressed: () =>
                          Navigator.pushReplacementNamed(context, '/'),
                      icon: const Icon(Icons.power_settings_new),
                      label: const Text(
                        "CERRAR SESIÓN TOTAL",
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.red.shade700,
                        foregroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
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

  // Widget para las tarjetas de información
  Widget _buildInfoCard(
    String label,
    String value,
    IconData icon,
    Color color,
  ) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black.withOpacity(0.05)),
        ),
        child: Column(
          children: [
            Icon(icon, color: color, size: 30),
            const SizedBox(height: 10),
            Text(
              value,
              style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              textAlign: TextAlign.center,
            ),
            Text(
              label,
              style: const TextStyle(fontSize: 11, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  // Widget para las filas de detalles
  Widget _buildListOption(
    IconData icon,
    String title,
    String trailing,
    Color color,
  ) {
    return Container(
      margin: const EdgeInsets.only(bottom: 10),
      padding: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
      ),
      child: ListTile(
        leading: Icon(icon, color: color),
        title: Text(title, style: const TextStyle(fontWeight: FontWeight.w500)),
        trailing: Text(
          trailing,
          style: const TextStyle(
            color: Colors.grey,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
