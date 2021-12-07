import 'package:artwork_crack/domain/Controllers/logincontroller.dart';
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
  @override
  Widget build(BuildContext context) {
    LoginController loginController = Get.find();
    return Container(
      decoration: const BoxDecoration(
        image: DecorationImage(
            image: NetworkImage(
                'https://blogger.googleusercontent.com/img/a/AVvXsEi9AOBpzpIlTrRMwU-38-ea_j-6cB5gTCYobF0BCJKFqVCVNurjJmGcMxHiIQoCYIJcumAG21-4bGeuSWGrawNFy-OXn38bTUwE4PstG2lXlYOdi1C352IM5a8sNH9R6Knm7Vv8UgMvzoBSB0LZ_KemLJgARiZJ_ox8U9JUt3Eh-tc5vh4nXcpdWFPj8g=s926'),
            fit: BoxFit.cover),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Stack(
          children: [
            Container(
              padding: const EdgeInsets.only(left: 35, top: 100),
              child: const Text(
                'Bienvenido a\nArtwork',
                style: TextStyle(color: Colors.white, fontSize: 35),
              ),
            ),
            SingleChildScrollView(
              child: Container(
                padding: EdgeInsets.only(
                    top: MediaQuery.of(context).size.height * 0.4),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: const EdgeInsets.only(left: 35, right: 35),
                      child: Column(
                        children: [
                          TextField(
                            controller: widget.NombreUsuarioController,
                            style: const TextStyle(color: Colors.black),
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Nombre Usuario",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 30,
                          ),
                          TextField(
                            style: const TextStyle(),
                            obscureText: true,
                            decoration: InputDecoration(
                                fillColor: Colors.grey.shade100,
                                filled: true,
                                hintText: "Contraseña",
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                )),
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const Text(
                                'Entrar',
                                style: TextStyle(
                                    fontSize: 27, fontWeight: FontWeight.w700),
                              ),
                              CircleAvatar(
                                radius: 30,
                                backgroundColor: const Color(0xff4c505b),
                                child: IconButton(
                                    color: Colors.white,
                                    onPressed: (){
                                          Get.to(()=>const ContentPage());
                                          loginController.asignarUsuario(widget.NombreUsuarioController.text);
                                        },
                                    icon: const Icon(
                                      Icons.arrow_forward,
                                    )),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 40,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) =>
                                            const MyRegister(),
                                      ));
                                },
                                child: const Text(
                                  'Registrarse',
                                  textAlign: TextAlign.left,
                                  style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18),
                                ),
                                style: const ButtonStyle(),
                              ),
                              TextButton(
                                  onPressed: () {},
                                  child: const Text(
                                    'Forgot Password',
                                    style: TextStyle(
                                      decoration: TextDecoration.underline,
                                      color: Color(0xff4c505b),
                                      fontSize: 18,
                                    ),
                                  )),
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
