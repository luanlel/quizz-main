import 'package:flutter/material.dart';
import 'tela_resultado.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final List<Map<String, Object>> perguntas = [
    {'pergunta': 'Qual a banda mais influente da história?', 
                    'alternativas': ['Queen', 'Led Zeppelin', 'The Beatles', 'The Rolling Stones'],
                    'resposta': 'The Beatles',
                    'imagem': 'lib/assets/bandas.jpg'},
    {'pergunta': 'Em qual país foi feito o sushi?', 
                    'alternativas': ['Inglaterra', 'Irlanda', 'México', 'Japão'],
                    'resposta': 'Japão',
                    'imagem': 'lib/assets/sushi.jpg'},
    {'pergunta': 'Quem escreveu O Senhor dos Anéis?',
                    'alternativas': ['J.R.R.Tolkien', 'C.S.Lewis', 'Brandon Sanderson', 'George Orwell'],
                    'resposta': 'J.R.R.Tolkien',
                    'imagem': 'lib/assets/senhor.webp'},
    {'pergunta': 'Em qual continente está o Monte Everest?', 
                    'alternativas': ['Europa', 'Antártida', 'Ásia', 'Oceania'],
                    'resposta': 'Ásia',
                    'imagem': 'lib/assets/everest.webp'},
    {'pergunta': 'Quando saiu o primeiro filme de Star Wars?', 
                    'alternativas': ['1977', '1980', '2001', '1994'],
                    'resposta': '1977',
                    'imagem': 'lib/assets/star.jpg'},
    {'pergunta': 'Quando o homem pisou na lua?', 
                    'alternativas': ['1959', '1969', '1979', '1989'],
                    'resposta': '1969',
                    'imagem': 'lib/assets/lua.avif'},
    {'pergunta': 'Qual é o nome da pintura mais famosa de Leonardo da Vinci?', 
                    'alternativas': ['A Última Ceia', 'Mona Lisa', 'Davi', 'Nascimento de Vênus'],
                    'resposta': 'Mona Lisa',
                    'imagem': 'lib/assets/leo.webp'},
    {'pergunta': 'Qual é o maior animal terrestre do mundo?', 
                    'alternativas': ['Rinoceronte', 'Elefante', 'Urso Pardo', 'Girafa'],
                    'resposta': 'Elefante',
                    'imagem': 'lib/assets/animais.png'},
    {'pergunta': 'Qual é o oceano mais profundo do mundo?', 
                    'alternativas': ['Pacífico', 'Atlântico', 'Ártico', 'Índico'],
                    'resposta': 'Pacífico',
                    'imagem': 'lib/assets/oceano.jpg'},
    {'pergunta': 'Quem pintou o teto da Capela Sistina?', 
                    'alternativas': ['Rafael', 'Botticelli', 'Michelangelo', 'Donatello'],
                    'resposta': 'Michelangelo',
                    'imagem': 'lib/assets/capela.jpg'}
  ];


  int indice = 0;
  int pontuacao = 0;
  String mensagem = '';

  void _verificarResposta(String respostaSelecionada) {
  String resposta = perguntas[indice]['resposta'] as String;

  setState(() {
    if (respostaSelecionada == resposta) {
      pontuacao++;
      mensagem = 'Correto!';
    } else {
      mensagem = 'Incorreto! A resposta correta é $resposta.';
    }

    if (indice < perguntas.length - 1) {
      indice++;
    } else {
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => TelaResultado(pontuacao: pontuacao, total: perguntas.length),
        ),
      ).then((_) {
        setState(() {
          indice = 0;
          pontuacao = 0;
          mensagem = '';
        });
      });
    }
  });
}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            flex: 5,
            child: Image.asset(
              perguntas[indice]['imagem'] as String,
              width: 100,
              height: 100,
              fit: BoxFit.contain,
            ),
          ),
          Expanded(
            flex: 7,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    perguntas[indice]['pergunta'] as String,
                    style: Theme.of(context).textTheme.headlineSmall,
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 20),
                  ...( perguntas[indice]['alternativas'] as List<String>).map((alternativas) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ElevatedButton(
                        onPressed: () => _verificarResposta(alternativas),
                        child: Text(alternativas),
                      ),
                    );
                  }),
                  const SizedBox(height: 20),
                  Text(
                    mensagem,
                    style: const TextStyle(
                      fontSize: 18,
                      color: Colors.blue,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
