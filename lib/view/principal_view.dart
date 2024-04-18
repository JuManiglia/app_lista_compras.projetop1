// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class ItemLista {
  String nome;
  String quantidade;
  bool isSelected;

  ItemLista(this.nome, this.quantidade, this.isSelected);
}

class PrincipalView extends StatefulWidget {
  const PrincipalView({super.key});

 

  @override
  State<PrincipalView> createState() => _PrincipalViewState();
}

class _PrincipalViewState extends State<PrincipalView> {
  List<ItemLista> lista = [];

  var txtNome = TextEditingController();
  var txtQuantidade = TextEditingController();
 void _editItem(BuildContext context, int index) {
  var txtNome = TextEditingController(text: lista[index].nome);
  var txtQuantidade = TextEditingController(text: lista[index].quantidade);

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text('Editar Item'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: txtNome,
              decoration: InputDecoration(hintText: 'Nome'),
            ),
            TextField(
              controller: txtQuantidade,
              decoration: InputDecoration(hintText: 'Qtde'),
            ),
          ],
        ),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              setState(() {
                lista[index].nome = txtNome.text;
                lista[index].quantidade = txtQuantidade.text;
              });
              Navigator.of(context).pop();
            },
            child: Text('Salvar'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text('Cancelar'),
          ),
        ],
      );
    },
  );
}
  @override
  void initState() {
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        home: Scaffold(
      appBar: AppBar(
        title: Text('Lista Fácil')
      ),
      body: ListView.builder(
        itemCount: lista.length,
        itemBuilder: (context, index) {
          return ListTile(

            tileColor: lista[index].isSelected ? Colors.green.shade100 : Colors.white,
            
            title: Text(lista[index].nome),
            subtitle: Text('Qtde: ${lista[index].quantidade}'),
            trailing: SizedBox(
              width: 120,
              child: Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.check),
                    onPressed: () {
                      setState(() {
                        lista[index].isSelected = !lista[index].isSelected;
                      });
                    },
                  ),
                  IconButton(
                    icon: Icon(Icons.delete),
                    onPressed: () {
                      setState(() {
                        lista.removeAt(index);
                      });
                    },
                  ),
                IconButton(
  icon: Icon(Icons.edit),
  onPressed: () {
    _editItem(context, index);
  },
  constraints: BoxConstraints.tightFor(
    width: 40, // Define o tamanho do ícone
    height: 40,
  )
  ,
),
 
  
  ]),
),
          );
        },
      ),
      
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.blue),
              child: Text('MENU'),
            ),
            ListTile(
              title: Text('Sobre Nós'),
              onTap: () {showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: Text("Sobre Nós"),
                      content: Text(
                          "Somos uma empresa fundada em 2024, preocupada em facilitar suas compras. Desenvolvemos um método intuitivo e simples para você criar, visualizar e gerenciar sua lista de compras."),
                      actions: <Widget>[
                        TextButton(
                          child: Text("OK"),
                          onPressed: () {
                            Navigator.of(context).pop();
                          }
                          )]);
               });
              }
   
            ),
      ListTile(
                 title: Text('Pesquisar'),
                 onTap: (){},
            )
        ])
      ),
      
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () { // Abre o AlertDialog quando o botão é pressionado    
    showDialog<String>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Adicionar'),
          content: Column(
            mainAxisSize: MainAxisSize.min, // Ajusta o tamanho do diálogo para o conteúdo
            children: [
              // Campo de texto para o nome
              TextField(
                controller: txtNome,
                decoration: InputDecoration(hintText: 'Nome'),
              ),
              // Campo de texto para a quantidade
              TextField(
                controller: txtQuantidade,
                decoration: InputDecoration(hintText: 'Qtde'),
              ),
            ],
          ),
          actions: <Widget>[
            // Botão para confirmar a adição do item
            TextButton(
              onPressed: () {
                // Atualiza o estado para adicionar um novo item à lista
                setState(() {
                  lista.add(
                    ItemLista(
                      txtNome.text,
                      txtQuantidade.text,
                      false, 
                    ),
                  );
                });

                // Limpa os campos de texto após adicionar o item
                txtNome.clear();
                txtQuantidade.clear();

                // Fecha o diálogo
                Navigator.of(context).pop();
              },
              child: Text('OK'),
            ),
          ],
        );
      },
    );
  },
)));}
}
