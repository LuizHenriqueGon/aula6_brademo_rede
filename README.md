# 🌐 Flutter Network & Async - BRADEMO

<p align="center">
<strong>Resolução das atividades práticas sobre Programação Assíncrona e Operações de Rede (HTTP), desenvolvidas para a disciplina de Programação para Dispositivos Móveis (PDMI6 / BRADEMO).</strong>
</p>

<p align="center">
<img src="https://img.shields.io/badge/Dart-0175C2?style=for-the-badge&logo=dart&logoColor=white" alt="Dart">
<img src="https://img.shields.io/badge/Flutter-02569B?style=for-the-badge&logo=flutter&logoColor=white" alt="Flutter">
<img src="https://img.shields.io/badge/Status-Completo-green?style=for-the-badge" alt="Status: Completo">
</p>

---

## 📖 Sobre o Projeto

Este repositório contém a implementação dos exercícios propostos na **Aula 6** da disciplina no **IFSP - Câmpus Bragança Paulista**. O projeto tem como foco central a compreensão da programação assíncrona no Dart (Futures, async/await, Streams) e o consumo de APIs RESTful na internet utilizando o framework Flutter e o pacote HTTP. 

---

## ✨ Exercícios Implementados

O projeto foi dividido para cobrir tanto a base teórica da linguagem Dart quanto a aplicação prática no Flutter consumindo a API pública **JSONPlaceholder**.

### Lista de Atividades:

* ⏳ **`Atividade 1 e 2 (Codelab Dart)`**: Práticas focadas no entendimento das palavras-chave `async` e `await`, além do uso correto de blocos `try-catch` para o tratamento de erros em operações assíncronas no Dart.
* 📱 **`Atividade 3 (App Flutter HTTP)`**: Aplicação completa contendo a interface gráfica e a lógica de comunicação com o servidor, dividida em:
  * 📦 **`models/post.dart`**: Classe de modelo responsável por realizar a serialização e conversão dos dados (JSON ↔ Objeto Dart).
  * 🖥️ **`pages/home_page.dart`**: Tela principal que gerencia o estado da aplicação (StatefulWidget) e implementa os verbos HTTP (`GET`, `POST`, `PUT`, `DELETE`).
  * 🚀 **`main.dart`**: Ponto de entrada do aplicativo configurado com o tema visual do projeto.

---

## 🚀 O que foi Aprendido?

Durante o desenvolvimento destas atividades, foram aplicados os seguintes conceitos técnicos:

* **Programação Assíncrona:** Domínio sobre a classe `Future`, entendendo os estados de uma requisição (incompleto e concluído/erro) e evitando o travamento da interface.
* **Operações de Rede (HTTP):** Utilização do pacote oficial `http` do Dart para consumir serviços web através de URIs.
* **Serialização de Dados:** Uso de `dart:convert` (`jsonDecode` e `jsonEncode`) e o padrão *factory* `fromJson`/`toJson` para tratar respostas de servidores REST.
* **Gerenciamento de Estado de UI:** Feedback visual ao usuário durante chamadas assíncronas (ex: exibição do `CircularProgressIndicator` enquanto aguarda a resposta da API).
* **Configurações Nativas:** Adição de permissões de acesso à internet no `AndroidManifest.xml`.

---

## 🛠️ Tecnologias e Pacotes Utilizados

* **Linguagem:** Dart
* **Framework:** Flutter (Material Design)
* **Pacote Externo:** `http` (https://pub.dev/packages/http)
* **API Utilizada:** JSONPlaceholder

---

## ⚙️ Começando

### Pré-requisitos
* Flutter SDK instalado na máquina.
* Emulador Android/iOS ou dispositivo físico configurado (com depuração USB).

### Execução
1. **Clone o repositório:**
   ```bash
   git clone https://github.com/LuizHenriqueGon/aula6_brademo_rede.git
   ```

2. **Entre na pasta do projeto:**
   ```bash
   cd aula6_brademo_rede

   ```


3. **Instale as dependências:**
   ```bash
   flutter pub get

   ```


4. **Execute o aplicativo:**
   ```bash
   flutter run

   ```



## 👨‍💻 Autor

Desenvolvido por **Luiz Henrique** Estudante de Análise e Desenvolvimento de Sistemas

IFSP - Câmpus Bragança Paulista

© 2026 BRADEMO Exercises. Todos os direitos reservados.
