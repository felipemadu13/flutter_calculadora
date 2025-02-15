import 'package:flutter/material.dart';
import 'package:flutter_calculadora/calculation_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreen();
}

class _HomeScreen extends State<HomeScreen> {
  num valorX = 0;
  num valorY = 0;
  num resultado = 0;

  Future<void> _atualizarValor(String incognita) async {
    final resultado = await Navigator.of(context).push(
      MaterialPageRoute(
        builder: (context) => CalculationScreen(incognita: incognita),
      ),
    );

    if (resultado != null && resultado is Map<String, num>) {
      setState(() {
        valorX = resultado['X'] ?? valorX;
        valorY = resultado['Y'] ?? valorY;
      });
    }
  }

  void _calcular() {
    setState(() {
      resultado = valorX + valorY;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Calculadora',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(valorX.toString()),
                ElevatedButton(
                  onPressed: () => _atualizarValor('X'),
                  child: const Text('Informar X'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Text(valorY.toString()),
                ElevatedButton(
                  onPressed: () => _atualizarValor('Y'),
                  child: const Text('Informar Y'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: _calcular,
              style: ElevatedButton.styleFrom(
                padding: const EdgeInsets.symmetric(
                  vertical: 10,
                  horizontal: 40,
                ),
                backgroundColor:
                    Theme.of(context).colorScheme.secondaryContainer,
                foregroundColor:
                    Theme.of(context).colorScheme.onSecondaryContainer,
              ),
              child: const Text(
                'Calcular',
                textAlign: TextAlign.center,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              'Resultado:',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onSecondaryContainer,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            const SizedBox(height: 10),
            Text(
              '$resultado',
              style: TextStyle(
                color: Theme.of(context).colorScheme.onTertiaryContainer,
                fontSize: 20,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
