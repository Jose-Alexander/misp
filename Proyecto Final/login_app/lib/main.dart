import 'package:flutter/material.dart';
// Importamos las pantallas y la navegación
import 'screens/joj1_login.dart';
import 'screens/joj2_registro.dart';
import 'navigation/main_navigation.dart';

void main() => runApp(const JojApp());

class JojApp extends StatelessWidget {
  const JojApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'JOJ Financiero',

      // Definimos los colores base para que toda la app se vea profesional
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8FCFF),
        primaryColor: const Color(0xFF004354),
        useMaterial3: true,
      ),

      // Definimos las rutas de navegación
      initialRoute: '/',
      routes: {
        // 1. Pantalla de inicio (Login)
        '/': (context) => const JOJ1(),

        // 2. Pantalla de registro
        '/registro': (context) => const JOJ2(),

        // 3. Sistema de navegación principal (Home)
        '/home': (context) {
          // Capturamos el nombre que el usuario escribió en el Login
          final String nombreLogueado =
              ModalRoute.of(context)?.settings.arguments as String? ??
              "Usuario";

          // Enviamos ese nombre a MainNavigation para que no dé error de compilación
          return MainNavigation(nombreUsuario: nombreLogueado);
        },
      },
    );
  }
}
