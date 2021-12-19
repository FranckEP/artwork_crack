import 'dart:io';

import 'package:artwork_crack/domain/use_cases/controllers/authentication.dart';
import 'package:artwork_crack/domain/use_cases/controllers/firestore_images.dart';
import 'package:artwork_crack/ui/navegador.dart';
import 'package:artwork_crack/ui/pages/content/estados/states_screen.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

// Widget que permite crear un estado
class AgregarEstado extends StatefulWidget {
  @override
  _AgregarEstadoState createState() => _AgregarEstadoState();
}

class _AgregarEstadoState extends State<AgregarEstado> {
  TextEditingController controltitulo = TextEditingController();
  TextEditingController controldetalle = TextEditingController();
  ControllerFirestore controlestados = Get.find();
  AuthController controluser = Get.find();

  ImagePicker picker = ImagePicker();
  var _image;
  late Color primary; 

  _galeria() async {
    XFile? image =
        await picker.pickImage(source: ImageSource.gallery, imageQuality: 50);

    setState(() {
      _image = (image != null) ? File(image.path) : null;
    });
  }

  _camara() async {
    XFile? image =
        await picker.pickImage(source: ImageSource.camera, imageQuality: 50);

    setState(() {
      _image = (image != null) ? File(image.path) : null;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              Center(
                child: GestureDetector(
                  onTap: () {
                    _opcioncamara(context);
                  },
                  child: Container(
                    padding: EdgeInsets.fromLTRB(10, 10, 10, 0),
                    height: 220,
                    width: double.maxFinite,
                    child: Card(
                      elevation: 5,
                      child: _image != null
                          ? Image.file(
                              _image,
                              width: 100,
                              height: 100,
                              fit: BoxFit.fitHeight,
                            )
                          : Icon(
                              Icons.camera_alt,
                            ),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: controltitulo,
                decoration: const InputDecoration(labelText: "Título"),
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: controldetalle,
                decoration: const InputDecoration(labelText: "Describe tú nuevo arte"),
              ),
              ElevatedButton( 
                style: ElevatedButton.styleFrom(primary: Colors.orange.shade400),
                child: const Text("Nuevo Estado"),
                onPressed: () {
                  var estados = <String, dynamic>{
                    'titulo': controltitulo.text,
                    'detalle': controldetalle.text,
                    'photo': controluser.photo,
                    'name': controluser.nameUser,
                    'uid': controluser.uid,
                    'fotoestado': ''
                  };

                  controlestados.crearestado(estados, _image);
                  Get.to(()=> ContentPage());
                  
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  //Seleccionar la camara o la galeria
  void _opcioncamara(context) {
    showModalBottomSheet(
        context: context,
        builder: (BuildContext bc) {
          return SafeArea(
            child: Container(
              child: Wrap(
                children: <Widget>[
                  ListTile(
                      leading: Icon(Icons.photo_library),
                      title: Text('Imagen de Galeria'),
                      focusColor: Color(0xffF4AC47),
                      onTap: () {
                        _galeria();
                        Navigator.of(context).pop();
                      }),
                  ListTile(
                    leading: Icon(Icons.photo_camera),
                    title: Text('Capturar Imagen'),
                    focusColor: Color(0xffF4AC47),
                    onTap: () {
                      _camara();
                      Navigator.of(context).pop();
                    },
                  ),
                ],
              ),
            ),
          );
        });
  }
}
