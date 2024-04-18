// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  


    // Função para lidar com a opção "Esqueci a senha"
    void _forgotPassword(BuildContext context) {
        // Mostra uma caixa de diálogo para o usuário inserir seu email
        showDialog(
            context: context,
            builder: (context) {
                // Controlador para o campo de texto do email
                var emailController = TextEditingController();

                return AlertDialog(
                    title: Text('Esqueci a senha'),
                    content: TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                            labelText: 'Digite seu email',
                            border: OutlineInputBorder(),
                        ),
                        keyboardType: TextInputType.emailAddress,
                    ),
                    actions: [
                        // Botão "Enviar"
                        TextButton(
                            onPressed: () {
                        // Obter o email inserido pelo usuário

                         ScaffoldMessenger.of(context).showSnackBar(
                         SnackBar(
                         content: Text('Email enviado para redefinição de senha.'),
                        ),
                        );

    // Fechar o diálogo após a ação
    Navigator.pop(context);
},

                            child: Text('Enviar', style: TextStyle(color: Colors.blue)),
                        ),
                        // Botão "Cancelar"
                        TextButton(
                            onPressed: () {
                                // Fechar o diálogo
                                Navigator.pop(context);
                            },
                            child: Text('Cancelar', style: TextStyle(color: Colors.red)),
                        ),
                    ],
                );
            },
        );
    }

    @override
    State<LoginView> createState() => _LoginViewState();

}

class _LoginViewState extends State<LoginView> {
  //
  // Atributos
  //

  //Identificador do formulário
  var formKey = GlobalKey<FormState>();

  //Controladores dos campos de texto
  var txtValor1 = TextEditingController();
  var txtValor2 = TextEditingController();



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.fromLTRB(50, 100, 50, 100),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              Image.asset(
                'lib/imagens/logolistafacil2.jpeg',
                width: 200,
                height: 200,
              ),
              SizedBox(height: 30),
              SizedBox(height: 30),
              //
              // CAMPO DE TEXTO
              //
              TextFormField(
                controller: txtValor1,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
                //
                // Validação
                //
                validator: (value) {
                  if (value == null) {
                    return 'Informe um valor';
                  } else if (value.isEmpty) {
                    return 'Informe um valor';
                  } 
                  return null;
                },
              ),

              SizedBox(height: 30),

              TextFormField(
                controller: txtValor2,
                style: TextStyle(fontSize: 32),
                decoration: InputDecoration(
                  labelText: 'Senha',
                  border: OutlineInputBorder(),
                ),
                //
                // Validação
                //
                validator: (value) {
                  if (value == null) {
                    return 'Informe um valor';
                  } else if (value.isEmpty) {
                    return 'Informe um valor';
                  } 

                  //Retornar null significa que o campo
                  //foi validado com sucesso!
                  return null;
                },
              ),

              SizedBox(height: 30),

              //
              // BOTÃO
              //
              //ElevatedButton, OutlinedButton, TextButton
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue.shade100,
                  foregroundColor: Colors.blue.shade900,
                  minimumSize: Size(200, 40),
                ),
                onPressed: () {
                  //
                  // Chamar os VALIDADORES
                  //
                  if (formKey.currentState!.validate()) {
                    
                    Navigator.pushNamed(context, 'principal');

                  }  
                },
                child: Text(
                  'entrar',
                  style: TextStyle(fontSize: 28),
                ),
              ),
               SizedBox(height: 10), // Espaçamento entre os botões
                            TextButton(
                            onPressed: () {
                           // Chama a função _forgotPassword de widget, passando o contexto atual
                           widget._forgotPassword(context);
                            },
                           child: Text('Esqueci a senha', style: TextStyle(color: Colors.blue)),
                           ),

                        ],
                    ),
                ),
            ),
        );
    }
}