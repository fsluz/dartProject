# 📱 Cadastro de Produtos com Flutter
# 🎯 Objetivo

# Desenvolver um aplicativo Flutter que permita o cadastro de produtos, armazenando os dados em uma lista local, sem necessidade de banco de dados.
# ✏️ Funcionalidades

    Cadastro de produto com os seguintes campos:

        Nome

        Preço de compra

        Preço de venda

        Quantidade

        Descrição

        Categoria (via Dropdown)

        URL da imagem

        Produto Ativo (Checkbox)

        Em Promoção (Switch)

        Desconto (%) (Slider)

    Validação dos campos obrigatórios:

        Nome

        Preço de compra

        Preço de venda

        Quantidade

        Descrição

    Armazenamento local (em uma lista, sem uso de banco de dados)

# 🧩 Requisitos Obrigatórios

# ✅ Tela de Cadastro de Produto

    Formulário com validações

    Utiliza:

        TextField

        CheckboxListTile

        SwitchListTile

        DropdownButtonFormField

        Slider

        Image.network

    Botão "Cadastrar Produto" adiciona o produto na lista e redireciona para a tela de listagem

# ✅ Tela de Listagem de Produtos

    Lista todos os produtos cadastrados

    Cada item mostra:

        Imagem (miniatura)

        Nome

        Preço de venda

    Ao clicar no item, navega para a tela de detalhes do produto

# ✅ Tela de Detalhes do Produto

    Mostra todos os dados do produto

    Destaque para:

        Imagem em tamanho maior

        Status de ativo/promoção com ícones coloridos

        Informações formatadas de forma legível

# 💡 Dicas Técnicas

    Utilize ListView.builder para exibir os produtos.

    Use setState() para atualizar os dados localmente.

    Para navegação entre as telas, utilize Navigator.push.

    Utilize errorBuilder para tratar falhas ao carregar imagens.

# 🚀 Tecnologias Utilizadas

    Flutter (Dart) com https://zapp.run/