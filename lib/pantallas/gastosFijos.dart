import 'package:flutter/material.dart';
import 'package:eco_avanzado/widgets/boton.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'dart:convert';

class GastosFijos extends StatefulWidget {
  final String sueldo;
  const GastosFijos({super.key, required this.sueldo});
  @override
  State<GastosFijos> createState() => _GastosFijosState();
}

class _GastosFijosState extends State<GastosFijos> {
  //---------------------variables-----------------
  final TextEditingController _nombreController = TextEditingController();
  final TextEditingController _montoController = TextEditingController();
  final List<Map<String, dynamic>> _gastos = [];

  //---------------------ciclo de vida-----------------
  @override
  void initState() {
    super.initState();
    _cargarGastos();
  }

  //---------------------persistencia-----------------
  void _guardarGastos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String gastosJson = jsonEncode(_gastos);
    await prefs.setString('gastos_fijos', gastosJson);
  }

  void _cargarGastos() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String? gastosJson = prefs.getString('gastos_fijos');
    if (gastosJson != null) {
      List<dynamic> data = jsonDecode(gastosJson);
      setState(() {
        _gastos.addAll(data.map((e) => Map<String, dynamic>.from(e)));
      });
    }
  }

  //---------------------funciones-----------------
  void _agregarGasto() async {
    final nombre = _nombreController.text.trim();
    final monto = int.tryParse(_montoController.text.trim());
    if (nombre.isNotEmpty && monto != null) {
      final sueldoDisponible = double.tryParse(widget.sueldo) ?? 0;
      final totalActual = _calcularTotal();
      final nuevoTotal = totalActual + monto;

      if (nuevoTotal > sueldoDisponible) {
        final continuar = await showDialog<bool>(
          context: context,
          builder:
              (context) => AlertDialog(
                title: const Text('Exceso de presupuesto'),
                content: Text(
                  'El total de gastos fijos ($nuevoTotal bs) excede tu sueldo disponible (${sueldoDisponible.toStringAsFixed(2)} bs).\n\n¿Deseas continuar de todos modos?',
                ),
                actions: [
                  TextButton(
                    onPressed: () => Navigator.pop(context, false),
                    child: const Text('No'),
                  ),
                  TextButton(
                    onPressed: () => Navigator.pop(context, true),
                    child: const Text('Sí'),
                  ),
                ],
              ),
        );

        if (continuar != true) return;
      }

      setState(() {
        _gastos.add({'nombre': nombre, 'monto': monto});
        _gastos.sort((a, b) => b['monto'].compareTo(a['monto']));
        _nombreController.clear();
        _montoController.clear();
      });
      _guardarGastos();
    }
  }

  void _eliminarGasto(int index) {
    setState(() {
      _gastos.removeAt(index);
    });
    _guardarGastos();
  }

  int _calcularTotal() {
    return _gastos.fold<int>(
      0,
      (suma, gasto) => suma + (gasto['monto'] as int),
    );
  }

  //---------------------widget-----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      //---------------------navbar-----------------
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          'Detalles de Gastos Fijos',
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 1.2,
            color: Colors.white,
            fontWeight: FontWeight.w400,
          ),
        ),
        backgroundColor: Color.fromARGB(200, 17, 31, 17),
        foregroundColor: Colors.white,
        toolbarHeight: 70,
      ),
      //---------------------navbar-----------------
      //---------------------degrade ---------------------------------
      body: Container(
        //---------------------degrade -----------------
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Text(
              'Sueldo disponible: ${widget.sueldo} Bs',
              style: const TextStyle(
                color: Colors.white,
                fontSize: 20,
                fontWeight: FontWeight.w700,
                letterSpacing: 1,
              ),
            ),
            SizedBox(height: 30),
            //---------------------filas  -----------------
            Row(
              children: [
                Expanded(
                  child: TextField(
                    controller: _nombreController,
                    decoration: const InputDecoration(
                      hintText: 'Detalles del gasto',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),
                SizedBox(width: 10),

                SizedBox(
                  width: 100,
                  child: TextField(
                    controller: _montoController,
                    keyboardType: TextInputType.number,
                    decoration: const InputDecoration(
                      hintText: 'Monto',
                      fillColor: Colors.white,
                      filled: true,
                    ),
                  ),
                ),

                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: _agregarGasto,
                  child: const Icon(Icons.add),
                ),
              ],
            ),
            //---------------------filas -----------------
            const SizedBox(height: 10),

            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Mantén pulsado sobre un gasto para eliminarlo.',
                style: TextStyle(color: Colors.white70, fontSize: 14),
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: ListView.builder(
                itemCount: _gastos.length,
                itemBuilder: (context, index) {
                  final gasto = _gastos[index];
                  return GestureDetector(
                    onLongPress: () => _eliminarGasto(index),
                    child: ListTile(
                      title: Text(
                        gasto['nombre'],
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          letterSpacing: 2,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      trailing: Text(
                        '${gasto['monto']} Bs',
                        style: const TextStyle(
                          color: Color.fromARGB(255, 202, 202, 202),
                          fontSize: 15,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
            Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              alignment: Alignment.centerRight,
              child: Text(
                'Total: ${_calcularTotal()} bs',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            SizedBox(height: 20),
            Boton(
              text: "Volver y guardar",
              onPressed: () {
                final total = _calcularTotal().toDouble();
                Navigator.pop(context, total);
              },
              colorbtn: const Color(0xFF4CAF50), // Verde (puedes cambiarlo)
              colortxt: Colors.black, // Color del texto
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
