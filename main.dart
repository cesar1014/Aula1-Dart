import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp(AppInicio());
}

class AppInicio extends StatefulWidget {
  @override
  _AppInicioState createState() => _AppInicioState();
}

class _AppInicioState extends State<AppInicio> {
  String _statusMessage = "Bem-vindo à aplicação!";

  @override
  void initState() {
    super.initState();
    // Adiciona os ouvintes para os eventos de pausa e retorno
    SystemChannels.lifecycle.setMethodCallHandler((call) {
      if (call.method == "AppLifecycleState.paused") {
        _showPauseMessage();
      } else if (call.method == "AppLifecycleState.resumed") {
        _showResumeMessage();
      }
      return Future.value();
    });
  }

  void _showPauseMessage() {
    setState(() {
      _statusMessage = "A aplicação foi pausada.";
    });
    // Você pode usar um snackbar ou dialog ao invés de mudar o texto
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(_statusMessage)),
    );
  }

  void _showResumeMessage() {
    setState(() {
      _statusMessage = "A aplicação retornou.";
    });
    // Você pode usar um snackbar ou dialog ao invés de mudar o texto
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(_statusMessage)),
    );
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'App Inicio',
      home: Scaffold(
        appBar: AppBar(
          title: Text('App Inicio'),
        ),
        body: Center(
          child: Text(
            _statusMessage,
            style: TextStyle(fontSize: 24),
          ),
        ),
      ),
    );
  }
}
