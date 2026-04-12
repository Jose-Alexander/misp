import 'package:flutter/material.dart';

class JOJ2 extends StatelessWidget {
  const JOJ2({super.key});

  @override
  Widget build(BuildContext context) {
    const Color primaryDark = Color(0xFF004354);
    const Color inputBg = Color(0xFFE1F1F9);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: const BackButton(color: primaryDark),
      ),
      body: SingleChildScrollView(
        // Evita el error de desbordamiento (overflow)
        padding: const EdgeInsets.symmetric(horizontal: 25),
        child: Column(
          children: [
            const Text(
              "Crea tu cuenta",
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
                color: primaryDark,
              ),
            ),
            const SizedBox(height: 25),
            _buildTextField("Usuario", Icons.person, inputBg),
            const SizedBox(height: 15),
            _buildTextField("Correo", Icons.email, inputBg),
            const SizedBox(height: 15),
            _buildTextField(
              "Contraseña",
              Icons.lock,
              inputBg,
              isPassword: true,
            ),
            const SizedBox(height: 30),
            SizedBox(
              width: double.infinity,
              height: 55,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: primaryDark,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () => Navigator.pushReplacementNamed(
                  context,
                  '/home',
                  arguments: "Nuevo Usuario",
                ),
                child: const Text(
                  "Registrarse",
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 30),
            // Uso de iconos locales para evitar errores de red HTTP 404
            Row(
              children: [
                _buildSocialBtn("Google", Icons.g_mobiledata),
                const SizedBox(width: 15),
                _buildSocialBtn("Apple", Icons.apple),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField(
    String hint,
    IconData icon,
    Color bg, {
    bool isPassword = false,
  }) {
    return TextField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon),
        filled: true,
        fillColor: bg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildSocialBtn(String label, IconData icon) {
    return Expanded(
      child: OutlinedButton.icon(
        onPressed: () {},
        icon: Icon(icon, color: Colors.black),
        label: Text(
          label,
          style: const TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
          ),
        ),
        style: OutlinedButton.styleFrom(
          padding: const EdgeInsets.symmetric(vertical: 12),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
      ),
    );
  }
}
