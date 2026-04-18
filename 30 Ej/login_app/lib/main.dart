import 'package:flutter/material.dart';
import 'Ejercicio 1.dart';
import 'Ejercicio 2.dart';
import 'Ejercicio 3.dart';
import 'Ejercicio 4.dart';
import 'Ejercicio 5.dart';
import 'Ejercicio 6.dart';
import 'Ejercicio 7.dart';
import 'Ejercicio 8.dart';
import 'Ejercicio 9.dart';
import 'Ejercicio 10.dart';
import 'Ejercicio 11.dart';
import 'Ejercicio 12.dart';
import 'Ejercicio 13.dart';
import 'Ejercicio 14.dart';
import 'Ejercicio 15.dart';
import 'Ejercicio 18.dart';
import 'Ejercicio 19.dart';
import 'Ejercicio 20.dart';
import 'Ejercicio 21.dart';
import 'Ejercicio 22.dart';
import 'Ejercicio 23.dart';
import 'Ejercicio 24.dart';
import 'Ejercicio 25.dart';
import 'Ejercicio 26.dart';
import 'Ejercicio 27.dart';
import 'Ejercicio 28.dart';
import 'Ejercicio 29.dart';
import 'Ejercicio 30.dart';
import 'Ejercicio 31.dart';
import 'Ejercicio 32.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Menú de Ejercicios',
      theme: ThemeData(primarySwatch: Colors.indigo, useMaterial3: true),
      home: const PantallaMenu(),
    );
  }
}

class PantallaMenu extends StatelessWidget {
  const PantallaMenu({super.key});

  @override
  Widget build(BuildContext context) {
    // Generar la lista de números válidos
    final List<int> ejerciciosValidos = List.generate(
      32,
      (i) => i + 1,
    ).where((n) => n != 16 && n != 17).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Mis Ejercicios Dart/Flutter'),
        backgroundColor: Colors.indigo,
        foregroundColor: Colors.white,
      ),
      body: ListView.separated(
        itemCount: ejerciciosValidos.length,
        separatorBuilder: (context, index) => const Divider(height: 1),
        itemBuilder: (context, index) {
          int num = ejerciciosValidos[index];
          return ListTile(
            leading: CircleAvatar(
              backgroundColor: Colors.indigoAccent,
              child: Text('$num', style: const TextStyle(color: Colors.white)),
            ),
            title: Text('Ejercicio $num'),
            subtitle: const Text('Presiona para ver la solución'),
            trailing: const Icon(Icons.arrow_forward_ios, size: 16),
            onTap: () => navegarA(context, num),
          );
        },
      ),
    );
  }

  // --- PASO 2: EL SWITCH CON TODOS LOS CASOS ---
  void navegarA(BuildContext context, int numero) {
    Widget pantalla;

    switch (numero) {
      case 1:
        pantalla = const Ejercicio1();
        break;
      case 2:
        pantalla = const Ejercicio2();
        break;
      case 3:
        pantalla = const Ejercicio3();
        break;
      case 4:
        pantalla = const Ejercicio4();
        break;
      case 5:
        pantalla = const Ejercicio5();
        break;
      case 6:
        pantalla = const Ejercicio6();
        break;
      case 7:
        pantalla = const Ejercicio7();
        break;
      case 8:
        pantalla = const Ejercicio8();
        break;
      case 9:
        pantalla = const Ejercicio9();
        break;
      case 10:
        pantalla = const Ejercicio10();
        break;
      case 11:
        pantalla = const Ejercicio11();
        break;
      case 12:
        pantalla = const Ejercicio12();
        break;
      case 13:
        pantalla = const Ejercicio13();
        break;
      case 14:
        pantalla = const Ejercicio14();
        break;
      case 15:
        pantalla = const Ejercicio15();
        break;
      case 18:
        pantalla = const Ejercicio18();
        break;
      case 19:
        pantalla = const Ejercicio19();
        break;
      case 20:
        pantalla = const Ejercicio20();
        break;
      case 21:
        pantalla = const Ejercicio21();
        break;
      case 22:
        pantalla = const Ejercicio22();
        break;
      case 23:
        pantalla = const Ejercicio23();
        break;
      case 24:
        pantalla = const Ejercicio24();
        break;
      case 25:
        pantalla = const Ejercicio25();
        break;
      case 26:
        pantalla = const Ejercicio26();
        break;
      case 27:
        pantalla = const Ejercicio27();
        break;
      case 28:
        pantalla = const Ejercicio28();
        break;
      case 29:
        pantalla = const Ejercicio29();
        break;
      case 30:
        pantalla = const Ejercicio30();
        break;
      case 31:
        pantalla = const Ejercicio31();
        break;
      case 32:
        pantalla = const Ejercicio32();
        break;
      default:
        pantalla = const Scaffold(body: Center(child: Text("No encontrado")));
    }

    Navigator.push(context, MaterialPageRoute(builder: (context) => pantalla));
  }
}
