import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CalculationScreen extends StatefulWidget {
  const CalculationScreen({required this.incognita, super.key});

  final String incognita;

  @override
  State<CalculationScreen> createState() {
    return _CalculationScreen();
  }
}

class _CalculationScreen extends State<CalculationScreen> {
  final TextEditingController _controller = TextEditingController();
  num? valorSelecionado;
  late String incognitaSelecionada;

  @override
  void initState() {
    super.initState();
    incognitaSelecionada = widget.incognita == 'X' ? 'X' : 'Y';
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          'Preencher Valores',
          style: TextStyle(color: Theme.of(context).colorScheme.onPrimary),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text('Set $incognitaSelecionada: '),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: _controller,
                    keyboardType: TextInputType.number,
                    inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                    onChanged: (value) {
                      setState(() {
                        valorSelecionado = num.tryParse(value);
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                      hintText: "Digite o valor de $incognitaSelecionada",
                      hintStyle: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if (_controller.text.isNotEmpty) {
                  final num? valor = num.tryParse(_controller.text);
                  if (valor != null) {
                    Navigator.pop(context, {incognitaSelecionada: valor});
                  }
                }
              },
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
                'Ok',
                textAlign: TextAlign.center,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
