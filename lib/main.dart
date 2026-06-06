import 'package:busca_clima2/app.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart'; // Certifique-se de que este import está aqui

void main() async { // 1. Adicionado o 'async' aqui
  // Garante que os bindings do Flutter estejam prontos
  WidgetsFlutterBinding.ensureInitialized();

  // 2. Adicionado o 'await' para carregar a localização em português antes do runApp
  await initializeDateFormatting('pt_BR', null);

  runApp(
    const ProviderScope(
      child: MyApp(),
    ),
  );
}