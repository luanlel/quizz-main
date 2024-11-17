import 'package:flutter/material.dart';
import 'tela_inicial.dart';

class TelaResultado extends StatelessWidget {
  final int pontuacao;
  final int total;

  const TelaResultado({super.key, required this.pontuacao, required this.total});

  String getMensagem() {
    if (pontuacao == total) {
      return "Você acertou tudo, parabéns! Deseja tentar novamente?";
    } else if (pontuacao >= 7) {
      return "Ótimo desempenho! Deseja tentar novamente?";
    } else if (pontuacao >= 4) {
      return "Desempenho mediano... Deseja tentar novamente?";
    } else {
      return "Você não se saiu tão bem... Por favor, tente novamente!";
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado do Quiz'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Pontuação: $pontuacao / $total',
              style: const TextStyle(fontSize: 24),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Text(
              getMensagem(),
              style: const TextStyle(fontSize: 20),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 40),
            ElevatedButton(
              onPressed: () {
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(builder: (context) => TelaInicial()),
                  (route) => false,
                );
              },
              child: const Text('Reiniciar Quiz'),
            ),
          ],
        ),
      ),
    );
  }
}
