import 'package:flutter/material.dart';

class JOJ1 extends StatefulWidget {
  const JOJ1({super.key});

  @override
  State<JOJ1> createState() => _JOJ1State();
}

class _JOJ1State extends State<JOJ1> {
  final TextEditingController _usuarioController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    const Color primaryDark = Color(0xFF004354);
    const Color inputBg = Color(0xFFD9EEF9);

    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 30),
          child: Column(
            children: [
              _buildBrandHeader(primaryDark),
              const SizedBox(height: 40),
              // Diseño de Tarjeta Blanca
              Container(
                padding: const EdgeInsets.all(30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 20,
                      offset: const Offset(0, 10),
                    ),
                  ],
                ),
                child: Column(
                  children: [
                    const Text(
                      "Acceso\nInstitucional",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: 28,
                        fontWeight: FontWeight.bold,
                        color: primaryDark,
                        height: 1.2,
                      ),
                    ),
                    const SizedBox(height: 35),
                    _buildLabel("CORREO ELECTRÓNICO O USUARIO"),
                    _buildTextField(
                      "nombre@ejemplo.com",
                      Icons.person_outline,
                      inputBg,
                      controller: _usuarioController,
                    ),
                    const SizedBox(height: 20),
                    _buildLabel("CONTRASEÑA"),
                    _buildTextField(
                      "••••••••",
                      Icons.lock_outline,
                      inputBg,
                      isPassword: true,
                    ),
                    const SizedBox(height: 35),
                    SizedBox(
                      width: double.infinity,
                      height: 55,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primaryDark,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        onPressed: () {
                          // Envía el nombre real a la navegación
                          Navigator.pushReplacementNamed(
                            context,
                            '/home',
                            arguments: _usuarioController.text.isNotEmpty
                                ? _usuarioController.text
                                : "Usuario",
                          );
                        },
                        child: const Text(
                          "Iniciar Sesión",
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 35),
                    OutlinedButton(
                      style: OutlinedButton.styleFrom(
                        side: BorderSide(color: Colors.grey.shade200),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        minimumSize: const Size(double.infinity, 50),
                      ),
                      onPressed: () =>
                          Navigator.pushNamed(context, '/registro'),
                      child: const Text(
                        "Crear cuenta nueva",
                        style: TextStyle(
                          color: primaryDark,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildLabel(String text) => Align(
    alignment: Alignment.centerLeft,
    child: Padding(
      padding: const EdgeInsets.only(bottom: 8),
      child: Text(
        text,
        style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 11),
      ),
    ),
  );

  Widget _buildTextField(
    String hint,
    IconData icon,
    Color bg, {
    bool isPassword = false,
    TextEditingController? controller,
  }) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: hint,
        prefixIcon: Icon(icon, color: Colors.grey.shade400),
        filled: true,
        fillColor: bg,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget _buildBrandHeader(Color color) => Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Icon(Icons.account_balance_rounded, color: color, size: 28),
      const SizedBox(width: 10),
      Text(
        "JOJ",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: color,
        ),
      ),
    ],
  );
}
