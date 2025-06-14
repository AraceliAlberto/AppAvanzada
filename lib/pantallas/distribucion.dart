import 'package:flutter/material.dart';
import 'package:eco_avanzado/pantallas/acercaDe.dart';
import 'package:eco_avanzado/pantallas/gastosFijos.dart';
import 'package:eco_avanzado/pantallas/gustos.dart';
import 'package:eco_avanzado/pantallas/sueldo.dart';
import 'package:eco_avanzado/pantallas/ayuda.dart';
import 'package:eco_avanzado/widgets/pieChart.dart';
import 'package:eco_avanzado/widgets/total_caja.dart';

class distribucionPantalla extends StatefulWidget {
  final String sueldo;

  const distribucionPantalla({super.key, required this.sueldo});

  @override
  State<distribucionPantalla> createState() => _distribucionPantallaState();
}

class _distribucionPantallaState extends State<distribucionPantalla> {
  //---------------------variables-----------------
  late double gastoFijo;
  late double deseos;
  late double ahorro;

  Map<String, double> dataMap = {};
  double sueldo = 0.0;
  double totalGastoFijo = 0;
  double totalDeseos = 0;
  double totalAhorro = 0;
  //---------------------funciones-----------------
  @override
  void initState() {
    super.initState();

    sueldo = double.tryParse(widget.sueldo) ?? 0;
    gastoFijo = double.parse(
      (double.parse(widget.sueldo) * 0.50).toStringAsFixed(3),
    );
    deseos = double.parse(
      (double.parse(widget.sueldo) * 0.30).toStringAsFixed(3),
    );
    ahorro = double.parse(
      (double.parse(widget.sueldo) * 0.20).toStringAsFixed(3),
    );

    dataMap = {
      "50% Gastos fijos": sueldo * 0.50,
      "30% Gustos": sueldo * 0.30,
      "20% Ahorro": sueldo * 0.20,
    };

    WidgetsBinding.instance.addPostFrameCallback((_) {
      mostrarAlertaAhorro();
    });
  }

  //void _navigateTo(Widget screen) {
  // Navigator.push(context, MaterialPageRoute(builder: (_) => screen));
  //}

  //---------------------cuerpo-----------------
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      //---------------------AppBar-----------------
      appBar: AppBar(
        backgroundColor: Color.fromARGB(200, 17, 31, 17),
        foregroundColor: Colors.white,
        centerTitle: true,
        toolbarHeight: 75,
        title: const Text(
          'Regla 50/30/20',
          style: TextStyle(
            fontSize: 20,
            letterSpacing: 1.2,
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.help_outline),
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const AyudaPantalla()),
              );
            },
          ),
        ],
        leading: PopupMenuButton<MenuItem>(
          icon: Icon(Icons.menu),
          onSelected: (value) {
            if (value == MenuItem.item1) {
              Navigator.of(context).push(
                MaterialPageRoute(builder: (context) => const sueldoPantalla()),
              );
            } else if (value == MenuItem.item2) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const GastosFijos(sueldo: ''),
                ),
              );
            } else if (value == MenuItem.item3) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const GustosPantalla(sueldo: ''),
                ),
              );
            } else if (value == MenuItem.item4) {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context) => const AcercadePantalla(),
                ),
              );
            }
          },
          itemBuilder:
              (BuildContext context) => <PopupMenuEntry<MenuItem>>[
                const PopupMenuItem<MenuItem>(
                  value: MenuItem.item1,
                  child: Text('Ir a Sueldo'),
                ),
                const PopupMenuItem<MenuItem>(
                  value: MenuItem.item2,
                  child: Text('Detalles Gastos Fijos'),
                ),
                const PopupMenuItem<MenuItem>(
                  value: MenuItem.item3,
                  child: Text('Detalles Deseos'),
                ),
                const PopupMenuItem<MenuItem>(
                  value: MenuItem.item4,
                  child: Text('Acerca De'),
                ),
              ],
        ),
      ),

      body: Center(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              //--------------------- Pie Chart ---------------------
              MyPieChart(dataMap: dataMap, centerText: '${widget.sueldo} Bs'),
              const SizedBox(height: 30),

              //--------------------- Cajas Totales ---------------------
              Card(
                color: const Color(0xFF2F4F4F),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    vertical: 16,
                    horizontal: 12,
                  ),
                  child: Column(
                    children: [
                      TotalCaja(
                        encabezado: 'Gasto fijo',
                        monto: '$gastoFijo bs',
                        mostrarOjo: true,
                        onVerDetalle: () async {
                          final resultado = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => GastosFijos(
                                    sueldo: (sueldo * 0.50).toStringAsFixed(2),
                                  ),
                            ),
                          );
                          if (resultado != null && resultado is double) {
                            setState(() {
                              totalGastoFijo = resultado;
                              totalAhorro =
                                  sueldo - totalGastoFijo - totalDeseos;
                              dataMap = {
                                "50% Gastos fijos": totalGastoFijo,
                                "30% Gustos": totalDeseos,
                                "20% Ahorro": totalAhorro,
                              };
                            });
                          }
                        },
                      ),
                      const Divider(color: Colors.white24),
                      TotalCaja(
                        encabezado: 'Deseos',
                        monto: '$deseos bs',
                        mostrarOjo: true,
                        onVerDetalle: () async {
                          final resultado = await Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder:
                                  (context) => GustosPantalla(
                                    sueldo: (sueldo * 0.30).toStringAsFixed(2),
                                  ),
                            ),
                          );
                          if (resultado != null && resultado is double) {
                            setState(() {
                              totalDeseos = resultado;
                              totalAhorro =
                                  sueldo - totalGastoFijo - totalDeseos;
                              dataMap = {
                                "50% Gastos fijos": totalGastoFijo,
                                "30% Gustos": totalDeseos,
                                "20% Ahorro": totalAhorro,
                              };
                            });
                          }
                        },
                      ),
                      const Divider(color: Colors.white24),
                      TotalCaja(
                        encabezado: 'Ahorro',
                        monto: '$ahorro bs',
                        mostrarOjo: false,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void mostrarAlertaAhorro() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('💡 Consejo de ahorro'),
          content: Text(
            'Recuerda ingresar ese 20% del dinero en una cuenta que no sea la habitual, como una cuenta de ahorro.\n\n'
            '💰 Monto sugerido: $ahorro Bs',
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Entendido'),
            ),
          ],
        );
      },
    );
  }
}

enum MenuItem { item1, item2, item3, item4 }
