import 'package:artwork_crack/domain/use_cases/controllers/firestore_images.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

// Widget que me permite editar un estado
class ModificarEstado extends StatefulWidget {
  final iddoc;
  final pos;
  final List estado;
  ModificarEstado({required this.estado, this.pos, this.iddoc});

  @override
  _ModificarEstadoState createState() => _ModificarEstadoState();
}

class _ModificarEstadoState extends State<ModificarEstado> {
  TextEditingController controltitulo = TextEditingController();
  TextEditingController controldetalle = TextEditingController();
  ControllerFirestore controlestados = Get.find();

  @override
  void initState() {
    controltitulo =
        TextEditingController(text: widget.estado[widget.pos]['titulo']);
    controldetalle =
        TextEditingController(text: widget.estado[widget.pos]['detalle']);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Editar arte"),
        backgroundColor: Colors.orange.shade400,
        actions: [
          IconButton(
              tooltip: 'Eliminar arte',
              icon: Icon(Icons.delete),
              onPressed: () {
                controlestados.eliminarestados(widget.estado[widget.pos].id);
                Get.back();
              })
        ],
      ),
      body: Container(
        padding: EdgeInsets.all(10.0),
        child: Center(
          child: ListView(
            children: <Widget>[
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: controltitulo,
                decoration: InputDecoration(labelText: "Titulo"),
              ),
              SizedBox(
                height: 15,
              ),
              TextField(
                controller: controldetalle,
                decoration: InputDecoration(labelText: "Detalle"),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(primary: Colors.orange.shade400),
                child: Text("Modificar arte"),
                onPressed: () {
                  var estado = <String, dynamic>{
                    'titulo': controltitulo.text,
                    'detalle': controldetalle.text,
                  };

                  controlestados.actualizarestado(
                      widget.estado[widget.pos].id, estado);

                  Get.back();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
