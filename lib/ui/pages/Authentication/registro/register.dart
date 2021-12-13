import 'package:artwork_crack/domain/use_cases/controllers/authentication.dart';
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
  final controllerName = TextEditingController();
  AuthController authenticationController = Get.find();

  _signup(email, password, name) async {
    try {
      await authenticationController.signUp(email: email, password: password, name: name);
      return true;
      /*Get.snackbar(
        "Sign Up",
        'OK',
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );*/
    } catch (err) {
      Get.snackbar(
        "Sign Up",
        err.toString(),
        icon: const Icon(Icons.person, color: Colors.red),
        snackPosition: SnackPosition.BOTTOM,
      );
      return false;
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
                child: ListView(
                    //mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const SizedBox(
                        height: 300,
                      ),
                      const Text(
                        "Crear nueva cuenta",
                        style: TextStyle(fontSize: 25, color: Colors.white,),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: controllerName,
                        keyboardType: TextInputType.emailAddress,
                        decoration:
                            const InputDecoration(labelText: "Nombre de usuario"),
                        validator: (value) {
                          if (value!.isEmpty) {
                            return "Enter user";
                          } else if (value.length < 6) {
                            return "Enter valid user";
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: controllerEmail,
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
                        controller: controllerPassword,
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
                          onPressed: ()async{
                            final form = _formKey.currentState;
                            form!.save();
                            // this line dismiss the keyboard by taking away the focus of the TextFormField and giving it to an unused
                            FocusScope.of(context).requestFocus(FocusNode());
                            if (_formKey.currentState!.validate()) {
                              var result = await _signup(controllerEmail.text,
                                  controllerPassword.text, controllerName.text);
                              authenticationController.isLogged.value = result;
                              Get.back();
                            }
                            
                          },
                          child: const Text("Registrarse", style: TextStyle(fontSize: 25, color: Colors.white,),)),
                    ]),
              )
        )
    );
  }
}
