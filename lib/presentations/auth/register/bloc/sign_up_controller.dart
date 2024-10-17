import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class SignUpController extends GetxController{

  TextEditingController controllerUsername = TextEditingController();
  TextEditingController controllerEmail = TextEditingController();
  TextEditingController controllerPassword = TextEditingController();
  RxBool isTogglePassword = false.obs;
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    controllerUsername.dispose();
    controllerEmail.dispose();
    controllerPassword.dispose();
  }

  void togglePassword(){
    isTogglePassword.value = !isTogglePassword.value;
  }




}