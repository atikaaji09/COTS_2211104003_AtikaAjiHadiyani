import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/onboarding_controller.dart';

class OnboardingView extends StatelessWidget {
  final OnboardingController controller = Get.put(OnboardingController());

  @override
  Widget build(BuildContext context) {
    final pages = [
      {
        'image': 'assets/images/onboarding1.png',
        'title': 'Selamat datang di gojek!',
        'description':
            'Aplikasi yang bikin hidupmu lebih nyaman. Siap bantuin semua kebutuhanmu, kapanpun, dan di manapun.',
      },
      {
        'image': 'assets/images/onboarding2.png',
        'title': 'Transportasi & logistik',
        'description':
            'Antarin kamu jalan atau ambilin barang lebih gampang tinggal ngeklik doang~',
      },
      {
        'image': 'assets/images/onboarding3.png',
        'title': 'Pesan makan & belanja',
        'description': 'Lagi ngidam sesuatu? Gojek beliin gak pakai lama.',
      },
    ];

    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView.builder(
              onPageChanged: controller.updatePage,
              itemCount: pages.length,
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(pages[index]['image']!, height: 250),
                    SizedBox(height: 20),
                    Text(
                      pages[index]['title']!,
                      style:
                          TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 10),
                    Text(
                      pages[index]['description']!,
                      textAlign: TextAlign.center,
                      style: TextStyle(color: Colors.grey),
                    ),
                  ],
                );
              },
            ),
          ),
          Obx(() => Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(
                  pages.length,
                  (index) => Container(
                    margin: EdgeInsets.all(4),
                    width: 10,
                    height: 10,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: controller.currentPage.value == index
                          ? Colors.green
                          : Colors.grey,
                    ),
                  ),
                ),
              )),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () {
                    // Navigate to login
                    Get.toNamed('/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green,
                  ),
                  child: Text('Masuk'),
                ),
                TextButton(
                  onPressed: () {
                    // Navigate to register
                    Get.toNamed('/register');
                  },
                  child: Text('Belum ada akun? Daftar dulu'),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
