import 'dart:async';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart'; 
class DisplayDataHora extends StatefulWidget {
  const DisplayDataHora({Key? key}) : super(key: key);

  @override
  State<DisplayDataHora> createState() => _DisplayDataHoraState();
}

class _DisplayDataHoraState extends State<DisplayDataHora> {
  String _dataFormatada = '';
  String _horaFormatada = '';
  late Timer _timer;

  @override
  void initState() {
    super.initState();
    _atualizarTempo();
    // Atualiza o relógio a cada 1 segundo
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer t) => _atualizarTempo());
  }

  @override
  void dispose() {
    _timer.cancel(); // Cancela o timer quando a tela fechar para evitar vazamento de memória
    super.dispose();
  }

  void _atualizarTempo() {
    final DateTime agora = DateTime.now();
    
    // Formatos: 'dd/MM/yyyy' gera 27/05/2026 | 'HH:mm' gera 23:03
    final String data = DateFormat('dd/MM/yyyy', 'pt_BR').format(agora);
    final String hora = DateFormat('HH:mm:ss', 'pt_BR').format(agora);

    setState(() {
      _dataFormatada = data;
      _horaFormatada = hora;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          _dataFormatada,
          style: const TextStyle(fontSize: 18, color: Colors.white70),
        ),
        const SizedBox(height: 4),
        Text(
          _horaFormatada,
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
        ),
      ],
    );
  }
}