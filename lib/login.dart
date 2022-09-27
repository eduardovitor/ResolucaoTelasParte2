import 'package:app_teste_2/usuario_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Center(child: Text("Login"))),
      body: const Padding(
        padding: EdgeInsets.all(16),
        child: MeuForm(),
      ),
    );
  }
}

class MeuForm extends StatefulWidget {
  const MeuForm({Key? key}) : super(key: key);

  @override
  State<MeuForm> createState() => _MeuFormState();
}

class _MeuFormState extends State<MeuForm> {
  TextEditingController _controllerEmail = TextEditingController();
  TextEditingController _controllerSenha = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: ListView(children: [
          TextFormField(
              controller: _controllerEmail,
              decoration: const InputDecoration(
                  labelText: "Email", hintText: "Digite seu email")),
          const SizedBox(height: 10),
          TextFormField(
              controller: _controllerSenha,
              obscureText: true,
              decoration: const InputDecoration(
                  labelText: "Senha", hintText: "Digite sua senha")),
          const SizedBox(height: 10),
          ElevatedButton(onPressed: onPressed, child: const Text("Entrar"))
        ]));
  }

  onPressed() async {
    bool eValido = _formKey.currentState!.validate();
    bool usuarioTeste = await UsuarioController()
        .login(_controllerEmail.text, _controllerSenha.text);
    if (eValido && usuarioTeste) {
      Navigator.pushNamed(context, '/home');
    }
  }
}
