import 'package:artwork_crack/domain/Controllers/authentication_controller.dart';
import 'package:artwork_crack/ui/pages/Authentication/login/login.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyRegister extends StatefulWidget {
  const MyRegister({Key? key}) : super(key: key);

  @override
  _MyRegisterState createState() => _MyRegisterState();
}

class _MyRegisterState extends State<MyRegister> {
  final _formKey = GlobalKey<FormState>();
  final controllerEmail = TextEditingController();
  final controllerPassword = TextEditingController();
  AuthenticationController authenticationController = Get.find();

  _signup(theEmail, thePassword) async {
    try {
      await authenticationController.signUp(theEmail, thePassword);

      Get.snackbar(
        "Sign Up",
        'OK',
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    } catch (err) {
      Get.snackbar(
        "Sign Up",
        err.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(   
      body: Container( 
              decoration: const BoxDecoration(
                image: DecorationImage(
                  image: AssetImage('assets/images/registro.jpg'),
                  fit: BoxFit.cover,
                ),
              ),
              padding: const EdgeInsets.all(20),
              child: Form(
                key: _formKey,
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 270,
                      ),
                      const Text(
                        "Crear nueva cuenta",
                        style: TextStyle(fontSize: 25, color: Colors.white,),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: this.controllerEmail,
                        decoration:
                            const InputDecoration(labelText: "Email address"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter email";
                          } else if (!value.contains('@')) {
                            return "Enter valid email address";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: this.controllerPassword,
                        decoration: const InputDecoration(labelText: "Password"),
                        keyboardType: TextInputType.number,
                        obscureText: true,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter password";
                          } else if (value.length < 6) {
                            return "Password should have at least 6 characters";
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextButton(
                          onPressed: () {
                            final form = _formKey.currentState;
                            form!.save();
                            // this line dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused
                            FocusScope.of(context).requestFocus(FocusNode());
                            if (_formKey.currentState!.validate()) {
                              _signup(controllerEmail.text,
                                  controllerPassword.text);
                            }
                          },
                          child: const Text("Registrarse", style: TextStyle(fontSize: 25, color: Colors.white,),)),
                    ]),
              )
        )
    );
  }
}
