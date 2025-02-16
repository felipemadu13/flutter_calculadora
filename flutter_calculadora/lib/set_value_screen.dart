import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class SetValueScreen extends StatefulWidget {
  const SetValueScreen({required this.incognita, super.key});

  final String incognita;

  @override
  State<SetValueScreen> createState() {
    return _SetValueScreen();
  }
}

class _SetValueScreen extends State<SetValueScreen> {
  final TextEditingController _controller = TextEditingController();
  late String incognitaSelecionada;

  @override
  void initState() {
    super.initState();
    incognitaSelecionada = widget.incognita;
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
