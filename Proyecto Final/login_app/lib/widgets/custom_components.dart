import 'package:flutter/material.dart';

// Esta es la barra de navegación (la "vara") con 5 iconos
Widget customBottomBar(BuildContext context, int currentIndex) {
  return BottomNavigationBar(
    type: BottomNavigationBarType.fixed, // Permite mostrar más de 3 iconos con etiquetas
    selectedItemColor: const Color(0xFF005662),
    unselectedItemColor: Colors.grey,
    currentIndex: currentIndex,
    onTap: (index) {
      // Control de navegación según el icono pulsado
      if (index == 0) Navigator.pushReplacementNamed(context, '/dashboard');
      if (index == 1) Navigator.pushReplacementNamed(context, '/presupuesto');
      if (index == 2) Navigator.pushReplacementNamed(context, '/deudas');
      if (index == 3) Navigator.pushReplacementNamed(context, '/reporte');
      if (index == 4) Navigator.pushReplacementNamed(context, '/perfil'); // Nueva ruta
    },
    items: const [
      BottomNavigationBarItem(
        icon: Icon(Icons.home),
        label: 'Inicio',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.pie_chart),
        label: 'Presupuesto',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.account_balance_wallet),
        label: 'Deudas',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.bar_chart),
        label: 'Reporte',
      ),
      BottomNavigationBarItem(
        icon: Icon(Icons.person),
        label: 'Perfil',
      ),
    ],
  );
}

// Contenedor blanco redondeado con sombra para los formularios
Widget cardContainer(List<Widget> children) {
  return Container(
    padding: const EdgeInsets.all(20),
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(15),
      boxShadow: const [
        BoxShadow(
          color: Colors.black12,
          blurRadius: 10,
          offset: Offset(0, 5),
        )
      ],
    ),
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: children,
    ),
  );
}

// Botón principal institucional (Verde oscuro)
Widget mainBtn(String text, VoidCallback onPressed) {
  return ElevatedButton(
    style: ElevatedButton.styleFrom(
      backgroundColor: const Color(0xFF005662),
      minimumSize: const Size(double.infinity, 50),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      elevation: 2,
    ),
    onPressed: onPressed,
    child: Text(
      text,
      style: const TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
        fontSize: 16,
      ),
    ),
  );
}

// Campo de texto personalizado con bordes redondeados
Widget customTextField(String label, String hint, {bool obscure = false}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      Text(
        label,
        style: const TextStyle(
          fontSize: 12,
          fontWeight: FontWeight.bold,
          color: Colors.grey,
        ),
      ),
      const SizedBox(height: 8),
      TextField(
        obscureText: obscure,
        decoration: InputDecoration(
          hintText: hint,
          filled: true,
          fillColor: const Color(0xFFF0F8FA), // Azul muy claro institucional
          contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide.none,
          ),
        ),
      ),
    ],
  );
}