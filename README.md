# Meals App

Aplicativo Flutter de receitas culinárias com navegação por categorias, sistema de favoritos e filtros personalizados.

## 📋 Sobre o Projeto

O **Meals App** é um aplicativo desenvolvido em Flutter que permite aos usuários explorar diferentes categorias de receitas, visualizar detalhes completos de cada prato (ingredientes e passos de preparo), marcar receitas como favoritas e aplicar filtros alimentares (vegano, vegetariano, sem glúten, sem lactose). O projeto demonstra conceitos avançados de navegação, gerenciamento de estado e organização de layouts no Flutter.

## 🚀 Tecnologias Utilizadas

- **Flutter** - Framework de desenvolvimento multiplataforma
- **Dart** (^3.11.5) - Linguagem de programação
- **Material Design** - Design system do Google para interface do usuário
- **google_fonts** (^8.1.0) - Pacote para utilização de fontes do Google
- **transparent_image** (^2.0.1) - Pacote para efeitos de carregamento de imagens

## 📱 Como Executar o Projeto

### Pré-requisitos

- Flutter SDK instalado ([Guia de instalação](https://docs.flutter.dev/get-started/install))
- Editor de código (VS Code, Android Studio, etc.)
- Emulador ou dispositivo físico configurado

### Passos para executar

1. Clone o repositório:
```bash
git clone https://github.com/gabrielMendes21/meals_app.git
cd meals_app
```

2. Instale as dependências:
```bash
flutter pub get
```

3. Verifique se há dispositivos disponíveis:
```bash
flutter devices
```

4. Execute o projeto:
```bash
flutter run
```

Ou escolha um dispositivo específico:
```bash
flutter run -d <device-id>
```

## 🎯 Principais Conceitos Aprendidos

- **Organização de layout com GridView**: Utilização do `GridView` com `SliverGridDelegateWithFixedCrossAxisCount` para criar uma grade responsiva de categorias de receitas, permitindo controle sobre espaçamento, proporção e número de colunas.

- **Tornando widgets tocáveis com InkWell**: Implementação do widget `InkWell` para adicionar interatividade aos elementos da interface, proporcionando feedback visual (efeito ripple) ao toque do usuário nos itens de categoria e receitas.

- **Cross-screen e tab-based navigation**: Navegação entre múltiplas telas usando `Navigator.push()` e `MaterialPageRoute`, combinada com navegação por abas através do `BottomNavigationBar`, permitindo alternar entre as telas de categorias e favoritos.

- **Stack e Positioned para posicionar widgets um em cima do outro**: Uso dos widgets `Stack` e `Positioned` para sobrepor elementos visuais, como posicionar informações de texto sobre imagens de receitas, criando layouts mais complexos e visualmente atraentes.

- **Utilizando Drawers**: Implementação de um menu lateral (`Drawer`) com `DrawerHeader` e `ListTile` para navegação adicional, permitindo acesso rápido às telas de filtros e outras funcionalidades do aplicativo.

- **Utilizando PopScope para obter dados retornados de uma screen**: Aplicação do widget `PopScope` com `onPopInvokedWithResult` para capturar e retornar dados da tela de filtros quando o usuário navega de volta, permitindo atualizar o estado da aplicação com as preferências selecionadas.

## 📁 Estrutura do Projeto
```
lib/
├── main.dart                   
├── data/
│   └── dummy_data.dart        
├── models/
│   ├── category.dart          
│   └── meal.dart              
├── screens/
│   ├── categories.dart        
│   ├── filters.dart           
│   ├── meal_details.dart      
│   ├── meals.dart             
│   └── tabs.dart              
└── widgets/
    ├── category_grid_item.dart
    ├── main_drawer.dart       
    ├── meal_item.dart         
    └── meal_item_trait.dart   
```

