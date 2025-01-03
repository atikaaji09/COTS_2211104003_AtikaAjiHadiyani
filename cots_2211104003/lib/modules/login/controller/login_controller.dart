import 'package:get/get.dart';

class LoginController extends GetxController {
  var isLoading = false.obs;
  var username = ''.obs;
  var password = ''.obs;

  void login() async {
    isLoading(true);
    // Lakukan proses login (misalnya, panggil API)
    await Future.delayed(Duration(seconds: 2)); // Simulasi delay
    isLoading(false);
    // Navigasi ke halaman berikutnya jika login berhasil
    Get.offNamed('/home');
  }
}
