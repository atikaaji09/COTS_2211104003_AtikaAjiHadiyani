import 'package:get/get.dart';

class OnboardingController extends GetxController {
  // Track current page index
  var currentPage = 0.obs;

  // Update the page index
  void updatePage(int index) {
    currentPage.value = index;
  }
}