import 'package:get/get.dart';

class ContenidoController extends GetxController{
  var listStates = [].obs;
  void addStates(state){
    listStates.add(state);
  }
  var listArte = [].obs;
  void addArte(state){
    listArte.add(state);
  }
}