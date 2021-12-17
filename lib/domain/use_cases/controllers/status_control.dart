import 'package:artwork_crack/domain/models/estados_model.dart';
import 'package:artwork_crack/domain/use_cases/management_states.dart';
import 'package:get/get.dart';

class StateController extends GetxController {
  StateController() {
    getStatus();
  }
  getStatus() async {
    listState.value = await statusManager.getstateOnce();
  }

  StatusManager statusManager = Get.find();
  var listState = [].obs; //lista vacia observable
  Future<void> addState({uid, content, picUrl, title}) async {
    var stateModel = Estados(
      content: content, 
      picUrl: picUrl, 
      title: title,
      uid: uid);
    try {
      await statusManager.sendStatus(stateModel);
      listState.add(stateModel);
    } catch (e) {
      return Future.error(e);
    }
  }
}