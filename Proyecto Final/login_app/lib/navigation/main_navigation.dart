import 'package:flutter/material.dart';
import '../screens/joj3_dashboard.dart';
import '../screens/joj4_deudas.dart';
import '../screens/joj5_presupuesto.dart';
import '../screens/joj6_reportes.dart';
import '../screens/joj7_perfil.dart';

class MainNavigation extends StatefulWidget {
  final String nombreUsuario; // Variable recibida desde main.dart

  const MainNavigation({super.key, required this.nombreUsuario});

  @override
  State<MainNavigation> createState() => _MainNavigationState();
}

class _MainNavigationState extends State<MainNavigation> {
  int _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    // Lista de pantallas corregida
    final List<Widget> _screens = [
      const JOJ3(),
      const JOJ4(),
      const JOJ5(),
      const JOJ6(),
      JOJ7(nombre: widget.nombreUsuario), // Corrección de la línea 28
    ];

    return Scaffold(
      body: _screens[_selectedIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _selectedIndex,
        onTap: (index) => setState(() => _selectedIndex = index),
        type: BottomNavigationBarType.fixed,
        selectedItemColor: const Color(0xFF005662),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.grid_view_rounded),
            label: 'INICIO',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_balance_wallet),
            label: 'DEUDAS',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.payments), label: 'GASTOS'),
          BottomNavigationBarItem(
            icon: Icon(Icons.bar_chart),
            label: 'REPORTES',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: 'PERFIL'),
        ],
      ),
    );
  }
}
