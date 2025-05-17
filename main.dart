import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class Produto {
  final String nome;
  final double preco;
  final String imagemUrl;

  Produto(this.nome, this.preco, this.imagemUrl);
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: CarrinhoDeCompras(),
    );
  }
}

class CarrinhoDeCompras extends StatefulWidget {
  @override
  _CarrinhoDeComprasState createState() => _CarrinhoDeComprasState();
}

class _CarrinhoDeComprasState extends State<CarrinhoDeCompras> {
  final List<Produto> produtos = [
    Produto('Maçã', 15.99, 'https://images.pexels.com/photos/102104/pexels-photo-102104.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    Produto('Banana', 23.99, 'https://images.pexels.com/photos/2872755/pexels-photo-2872755.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    Produto('Uva verde', 19.99, 'https://images.pexels.com/photos/5945850/pexels-photo-5945850.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    Produto('Morango', 22.99, 'https://images.pexels.com/photos/934055/pexels-photo-934055.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    Produto('Laranja', 33.99, 'https://images.pexels.com/photos/54369/pexels-photo-54369.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
    Produto('Melancia', 20.99, 'https://images.pexels.com/photos/1313267/pexels-photo-1313267.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1'),
  ];

  double totalCompra = 0.0;

  void adicionarAoCarrinho(double preco) {
    setState(() {
      totalCompra += preco;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Carrinho de Compras'),
        backgroundColor: Color.fromRGBO(62, 59, 255, 1),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2, 
                    crossAxisSpacing: 10.0,
                    mainAxisSpacing: 10.0,
                  ),
                  itemCount: produtos.length,
                  itemBuilder: (context, index) {
                    final produto = produtos[index];
                    return Card(
                      elevation: 4.0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Expanded(
                            child: Image.network(
                              produto.imagemUrl,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              produto.nome,
                              textAlign: TextAlign.center,
                              style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.symmetric(vertical: 4.0),
                            child: Text(
                              'R\$ ${produto.preco.toStringAsFixed(2)}',
                              style: TextStyle(fontSize: 14, color: Colors.green),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: () => adicionarAoCarrinho(produto.preco),
                            child: Text('Adicionar'),
                            style: ElevatedButton.styleFrom(
                              primary: Color.fromRGBO(62, 59, 255, 1),
                            ),
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                color:Color.fromRGBO(62, 59, 255, 1),
                padding: EdgeInsets.symmetric(vertical: 16.0, horizontal: 20.0),
                child: Text(
                  'Total: R\$ ${totalCompra.toStringAsFixed(2)}',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
