import 'package:artwork_crack/domain/use_cases/controllers/authentication.dart';
import 'package:artwork_crack/ui/navegador.dart';
import 'package:artwork_crack/ui/pages/Authentication/registro/register.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyLogin extends StatefulWidget {
   MyLogin({Key? key}) : super(key: key);

   TextEditingController NombreUsuarioController = TextEditingController();

  @override
  _MyLoginState createState() => _MyLoginState();
}

class _MyLoginState extends State<MyLogin> {
  final _formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  AuthController authenticationController = Get.find();

  _login(theEmail, thePassword) async {
    print('_login $theEmail $thePassword');
    try {
      await authenticationController.login(theEmail, thePassword);
    } catch (err) {
      Get.snackbar(
        "Login",
        err.toString(),
        icon: Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ListView(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                      width: 400,
                      height: 400,
                      decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/logo.png"),))
                ),
                Form(
                  key: _formKey,
                  child:
                    Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      controller: controllerEmail,
                      decoration: const InputDecoration(labelText: "Email"),
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Ingrese el email";
                        } else if (!value.contains('@')) {
                          return "Ingrese un email válido";
                        }
                      },
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    TextFormField(
                      controller: controllerPassword,
                      decoration: InputDecoration(labelText: "Contraseña"),
                      keyboardType: TextInputType.number,
                      obscureText: true,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Ingrese la contraseña";
                        } else if (value.length < 6) {
                          return "La contraseña debería tener como mínimo 6 carácteres";
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    OutlinedButton(
                        onPressed: () async {
                          FocusScope.of(context).requestFocus(FocusNode());
                          final form = _formKey.currentState;
                          form!.save();
                          if (_formKey.currentState!.validate()) {
                            await _login(
                              controllerEmail.text, controllerPassword.text);
                          }
                        },
                        child: const Text("Entrar")),
                  ]),
                ),
                TextButton(
                    onPressed: () {
                      Get.to(() => const MyRegister());
                    },
                    child: const Text("Crear cuenta"))
              ],
            ),
          ),
        ],
      ),
    );
  }
}
