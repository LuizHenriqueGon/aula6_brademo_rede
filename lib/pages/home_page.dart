// Arquivo: lib/pages/home_page.dart
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../models/post.dart'; // Importando o modelo que criamos

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  String _resultado = "Escolha uma operação acima para testar a API.";
  bool _carregando = false;

  // URL base do serviço JSONPlaceholder
  final String _baseUrl = 'https://jsonplaceholder.typicode.com/posts';

  // --- Funções Auxiliares de Tela ---
  void _setCarregando() {
    setState(() {
      _carregando = true;
      _resultado = "Aguardando resposta do servidor...";
    });
  }

  void _setResultado(String texto) {
    setState(() {
      _carregando = false;
      _resultado = texto;
    });
  }

  // --- 1. Operação GET (Recuperar um) ---
  Future<void> getSingle() async {
    _setCarregando();
    try {
      final response = await http.get(Uri.parse('$_baseUrl/1'));
      if (response.statusCode == 200) {
        Post post = Post.fromJson(jsonDecode(response.body));
        _setResultado("GET (Único):\n\nID: ${post.id}\nTítulo: ${post.title}\nCorpo: ${post.body}");
      } else {
        _setResultado("Erro no GET: Status ${response.statusCode}");
      }
    } catch (e) {
      _setResultado("Falha na requisição: $e");
    }
  }

  // --- 2. Operação GET (Recuperar Lista) ---
  Future<void> getList() async {
    _setCarregando();
    try {
      final response = await http.get(Uri.parse(_baseUrl));
      if (response.statusCode == 200) {
        List<dynamic> listaJson = jsonDecode(response.body);
        _setResultado("GET (Lista):\n\nRecuperados ${listaJson.length} itens da API.\nTítulo do item 1: ${listaJson[0]['title']}");
      } else {
        _setResultado("Erro no GET Lista: Status ${response.statusCode}");
      }
    } catch (e) {
      _setResultado("Falha na requisição: $e");
    }
  }

  // --- 3. Operação POST (Criar) ---
  Future<void> postData() async {
    _setCarregando();
    try {
      final response = await http.post(
        Uri.parse(_baseUrl),
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'title': 'Título de Teste PDMI6',
          'body': 'Corpo do post de teste',
          'userId': 101,
        }),
      );
      if (response.statusCode == 201) { // 201 significa "Criado"
        _setResultado("POST (Criar):\n\nStatus: ${response.statusCode}\nResposta do Servidor:\n${response.body}");
      } else {
        _setResultado("Erro no POST: Status ${response.statusCode}");
      }
    } catch (e) {
      _setResultado("Falha na requisição: $e");
    }
  }

  // --- 4. Operação PUT (Atualizar) ---
  Future<void> putData() async {
    _setCarregando();
    try {
      final response = await http.put(
        Uri.parse('$_baseUrl/1'), // Atualizando o post de ID 1
        headers: {'Content-Type': 'application/json; charset=UTF-8'},
        body: jsonEncode({
          'id': 1,
          'title': 'Título Modificado com PUT',
          'body': 'Conteúdo modificado',
          'userId': 1,
        }),
      );
      if (response.statusCode == 200) {
        _setResultado("PUT (Atualizar):\n\nStatus: ${response.statusCode}\nResposta do Servidor:\n${response.body}");
      } else {
        _setResultado("Erro no PUT: Status ${response.statusCode}");
      }
    } catch (e) {
      _setResultado("Falha na requisição: $e");
    }
  }

  // --- 5. Operação DELETE (Apagar) ---
  Future<void> deleteData() async {
    _setCarregando();
    try {
      final response = await http.delete(Uri.parse('$_baseUrl/1')); // Apagando o post de ID 1
      if (response.statusCode == 200) {
        _setResultado("DELETE (Apagar):\n\nRecurso apagado com sucesso!\nStatus: ${response.statusCode}\nResposta (vazia): ${response.body}");
      } else {
        _setResultado("Erro no DELETE: Status ${response.statusCode}");
      }
    } catch (e) {
      _setResultado("Falha na requisição: $e");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Aula 6 (BRADEMO) - Rede'),
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            // Botões de Ação
            Wrap(
              spacing: 10,
              runSpacing: 10,
              alignment: WrapAlignment.center,
              children: [
                ElevatedButton(onPressed: getSingle, child: const Text('GET (1)')),
                ElevatedButton(onPressed: getList, child: const Text('GET (Lista)')),
                ElevatedButton(onPressed: postData, child: const Text('POST')),
                ElevatedButton(onPressed: putData, child: const Text('PUT')),
                ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red[100]), onPressed: deleteData, child: const Text('DELETE')),
              ],
            ),
            const SizedBox(height: 20),
            
            // Área de Resposta
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(color: Colors.green, width: 2),
                ),
                child: _carregando
                    ? const Center(child: CircularProgressIndicator())
                    : SingleChildScrollView(
                        child: Text(
                          _resultado,
                          style: const TextStyle(fontSize: 16, fontFamily: 'monospace'),
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