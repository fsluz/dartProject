import 'package:flutter/material.dart';

void main() => runApp(ProdutoApp());

class ProdutoApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Cadastro de Produtos',
      theme: ThemeData(
        primarySwatch: Colors.purple,
        scaffoldBackgroundColor: Color(0xFFF2E9F7),
        appBarTheme: AppBarTheme(
          backgroundColor: Color(0xFFD1B2F0),
          centerTitle: true,
          titleTextStyle: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: Colors.white,
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          prefixIconColor: Colors.purple,
        ),
        cardColor: Color(0xFFF2F0F5),
      ),
      home: CadastroProdutoPage(),
    );
  }
}

class Produto {
  final String nome;
  final double precoCompra;
  final double precoVenda;
  final int quantidade;
  final String descricao;
  final String categoria;
  final String imagemUrl;
  final bool ativo;
  final bool promocao;
  final double desconto;

  Produto({
    required this.nome,
    required this.precoCompra,
    required this.precoVenda,
    required this.quantidade,
    required this.descricao,
    required this.categoria,
    required this.imagemUrl,
    required this.ativo,
    required this.promocao,
    required this.desconto,
  });
}

List<Produto> produtos = [];

class CadastroProdutoPage extends StatefulWidget {
  @override
  _CadastroProdutoPageState createState() => _CadastroProdutoPageState();
}

class _CadastroProdutoPageState extends State<CadastroProdutoPage> {
  final _formKey = GlobalKey<FormState>();
  final _nomeController = TextEditingController();
  final _precoCompraController = TextEditingController();
  final _precoVendaController = TextEditingController();
  final _quantidadeController = TextEditingController();
  final _descricaoController = TextEditingController();
  final _imagemController = TextEditingController();
  String _categoria = 'Roupas';
  bool _ativo = true;
  bool _promocao = false;
  double _desconto = 0;

  void _cadastrarProduto() {
    if (_formKey.currentState!.validate()) {
      final produto = Produto(
        nome: _nomeController.text,
        precoCompra: double.parse(_precoCompraController.text),
        precoVenda: double.parse(_precoVendaController.text),
        quantidade: int.parse(_quantidadeController.text),
        descricao: _descricaoController.text,
        categoria: _categoria,
        imagemUrl: _imagemController.text,
        ativo: _ativo,
        promocao: _promocao,
        desconto: _desconto,
      );
      produtos.add(produto);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => ListaProdutosPage()),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Cadastro de Produto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Form(
          key: _formKey,
          child: ListView(
            children: [
              Text('Informações do Produto', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
              SizedBox(height: 10),
              TextFormField(
                controller: _nomeController,
                decoration: InputDecoration(labelText: 'Nome do Produto', prefixIcon: Icon(Icons.label)),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _precoCompraController,
                decoration: InputDecoration(labelText: 'Preço de compra', prefixIcon: Icon(Icons.attach_money)),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _precoVendaController,
                decoration: InputDecoration(labelText: 'Preço de venda', prefixIcon: Icon(Icons.price_change)),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _quantidadeController,
                decoration: InputDecoration(labelText: 'Quantidade em Estoque', prefixIcon: Icon(Icons.store)),
                keyboardType: TextInputType.number,
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _descricaoController,
                decoration: InputDecoration(labelText: 'Descrição', prefixIcon: Icon(Icons.description)),
                validator: (value) => value!.isEmpty ? 'Campo obrigatório' : null,
              ),
              SizedBox(height: 10),
              DropdownButtonFormField<String>(
                value: _categoria,
                decoration: InputDecoration(labelText: 'Categoria', prefixIcon: Icon(Icons.category)),
                items: ['Roupas', 'Eletrônicos', 'Alimentos'].map((cat) => DropdownMenuItem(value: cat, child: Text(cat))).toList(),
                onChanged: (value) => setState(() => _categoria = value!),
              ),
              SizedBox(height: 10),
              TextFormField(
                controller: _imagemController,
                decoration: InputDecoration(labelText: 'URL da Imagem', prefixIcon: Icon(Icons.image)),
              ),
              SizedBox(height: 10),
              CheckboxListTile(
                title: Text('Produto Ativo'),
                value: _ativo,
                onChanged: (value) => setState(() => _ativo = value!),
                activeColor: Colors.purple,
              ),
              SwitchListTile(
                title: Text('Produto em Promoção'),
                value: _promocao,
                onChanged: (value) => setState(() => _promocao = value!),
                activeColor: Colors.red,
              ),
              Text('Desconto (%)'),
              Slider(
                value: _desconto,
                min: 0,
                max: 100,
                divisions: 20,
                label: '${_desconto.toInt()}%',
                onChanged: (value) => setState(() => _desconto = value),
                activeColor: Colors.purple,
              ),
              SizedBox(height: 10),
              ElevatedButton.icon(
                icon: Icon(Icons.check),
                label: Text('Cadastrar Produto'),
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.purple,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(30)),
                ),
                onPressed: _cadastrarProduto,
              )
            ],
          ),
        ),
      ),
    );
  }
}

class ListaProdutosPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Lista de Produtos')),
      body: ListView.builder(
        itemCount: produtos.length,
        itemBuilder: (context, index) {
          final produto = produtos[index];
          return GestureDetector(
            onTap: () {
              // Navegar para a página de detalhes ao clicar no item
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetalhesProdutoPage(produto: produto),
                ),
              );
            },
            child: Card(
              margin: EdgeInsets.all(10),
              elevation: 3,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('Nome: ${produto.nome}', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Color(0xFF202881))),
                    Divider(thickness: 2),
                    Text('Preço de compra: R\$ ${produto.precoCompra.toStringAsFixed(2)}'),
                    Text('Preço de venda: R\$ ${produto.precoVenda.toStringAsFixed(2)}'),
                    Text('Quantidade: ${produto.quantidade}'),
                    Text('Categoria: ${produto.categoria}'),
                    Text('Descrição: ${produto.descricao}'),
                    Divider(thickness: 2),
                    SizedBox(
                      height: 160,
                      width: double.infinity,
                      child: Image.network(
                        produto.imagemUrl,
                        fit: BoxFit.contain,
                        errorBuilder: (context, error, stackTrace) => Icon(Icons.image_not_supported),
                      ),
                    ),
                    Divider(thickness: 2),
                    Row(
                      children: [
                        Icon(produto.ativo ? Icons.check_circle : Icons.cancel, color: produto.ativo ? Colors.green : Colors.grey),
                        SizedBox(width: 8),
                        Text('Produto Ativo: ${produto.ativo ? 'Sim' : 'Não'}'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(produto.promocao ? Icons.local_offer : Icons.local_offer_outlined, color: produto.promocao ? Colors.red : Colors.grey),
                        SizedBox(width: 8),
                        Text('Em Promoção: ${produto.promocao ? 'Sim' : 'Não'}'),
                      ],
                    ),
                    Row(
                      children: [
                        Icon(Icons.percent),
                        SizedBox(width: 8),
                        Text('Desconto: ${produto.desconto.toInt()}%'),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}

class DetalhesProdutoPage extends StatelessWidget {
  final Produto produto;

  DetalhesProdutoPage({required this.produto});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Detalhes do Produto')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Nome: ${produto.nome}', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            SizedBox(height: 10),
            Text('Preço de Compra: R\$ ${produto.precoCompra.toStringAsFixed(2)}'),
            Text('Preço de Venda: R\$ ${produto.precoVenda.toStringAsFixed(2)}'),
            Text('Quantidade: ${produto.quantidade}'),
            Text('Descrição: ${produto.descricao}'),
            Text('Categoria: ${produto.categoria}'),
            SizedBox(height: 10),
            Image.network(
              produto.imagemUrl,
              height: 200,
              fit: BoxFit.contain,
              errorBuilder: (context, error, stackTrace) => Icon(Icons.image_not_supported),
            ),
            SizedBox(height: 10),
            Text('Produto Ativo: ${produto.ativo ? 'Sim' : 'Não'}'),
            Text('Em Promoção: ${produto.promocao ? 'Sim' : 'Não'}'),
            Text('Desconto: ${produto.desconto.toInt()}%'),
          ],
        ),
      ),
    );
  }
}
