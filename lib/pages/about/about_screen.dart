import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AboutScreen extends StatefulWidget {
  _AboutScreen createState() => _AboutScreen();
}

class _AboutScreen extends State<AboutScreen> {
  @override
  void initState() {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Sobre',
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Modular.to.pushReplacementNamed('/home'),
        ),
      ),
      body: ListView(padding: EdgeInsets.zero, children: <Widget>[
        Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 15),
                  child: Text('INFORMAÇÕES DO APLICATIVO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 5),
                  child: Text(
                      'O aplicativo apresenta informações sobre a realização dos Enades (Exame Nacional de Desempenho dos Estudantes) de 2015 a 2018, no estado de Pernambuco, com foco nas questões sobre o estudante, percepção da prova e compatibilidade entre os conteúdos vistos na graduação e os conteúdos da prova, a infraestrutura proporcionada pela universidade durante a graduação.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black87)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 0, bottom: 25),
                  child: Text(
                      'Os dados são apresentados através de gráficos, que ilustram a quantidade de alunos que realizaram o Enade em cada ano, em qualquer universidade do estado de Pernambuco. O aplicativo também possibilita a realização de outros filtros, como a análise por curso e séries temporais, que demonstram a variação da opinião do aluno com relação a percepeção da prova ao longo dos anos.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black87)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 25),
                  child: Text('POLÍTICA DE PRIVACIDADE',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 5, bottom: 15),
                  child: Text('Que tipo de informações coletamos?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 5),
                  child: Text(
                      'O aplicativo coleta apenas as informações necessárias para você realizar o login na sua conta.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black87)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 25, bottom: 15),
                  child: Text('TERMOS DE USO',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Colors.black87, fontWeight: FontWeight.bold)),
                ),
                Padding(
                  padding: EdgeInsets.only(top: 15, bottom: 5),
                  child: Text(
                      'Ao acessar o aplicativo, você permite que nós tenhamos acesso as suas credenciais de login. Porém, lembramos que essas informações podem ser pessoais ou não, o usuário decide quais os dados irá inserir no momento do seu cadastro.',
                      textAlign: TextAlign.justify,
                      style: TextStyle(color: Colors.black87)),
                ),
              ],
            ))
      ]),
    );
  }
}
