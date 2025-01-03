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
          Padding(
            padding: const EdgeInsets.only(top: 16.0, left: 16.0, right: 16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.asset(
                  'assets/images/logo_gojek.png', // Ganti dengan path logo Gojek
                  height: 40,
                ),
                Image.asset(
                  'assets/images/bahasa.png', // Ganti dengan path logo IDN
                  height: 30,
                ),
              ],
            ),
          ),
          SizedBox(
            height: 10,
          ), // Tambahkan jarak antara header dan konten utama
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
                // Tombol "Masuk"
                ElevatedButton(
                  onPressed: () {
                    // Navigasi ke halaman login
                    Get.toNamed('/login');
                  },
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.green, // Warna hijau latar
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(50), // Membulatkan sudut tombol
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 16), // Tinggi tombol
                    minimumSize:
                        Size(double.infinity, 48), // Lebar tombol penuh
                  ),
                  child: Text(
                    'Masuk',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.white, // Teks putih
                    ),
                  ),
                ),
                SizedBox(
                    height:
                        12), // Jarak antara tombol "Masuk" dan "Daftar dulu"

                // Tombol "Belum ada akun? Daftar dulu"
                OutlinedButton(
                  onPressed: () {
                    // Navigasi ke halaman daftar
                    Get.toNamed('/register');
                  },
                  style: OutlinedButton.styleFrom(
                    side: BorderSide(
                        color: Colors.green, width: 2), // Border hijau
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(50), // Membulatkan sudut tombol
                    ),
                    padding:
                        EdgeInsets.symmetric(vertical: 16), // Tinggi tombol
                    minimumSize:
                        Size(double.infinity, 48), // Lebar tombol penuh
                  ),
                  child: Text(
                    'Belum ada akun?, Daftar dulu',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: Colors.green, // Teks hijau
                    ),
                  ),
                ),

                SizedBox(
                    height: 16), // Jarak antara tombol dan teks di bawahnya

                // Keterangan persetujuan
                Text(
                  'Dengan masuk atau mendaftar, kamu menyetujui',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 12,
                  ),
                  textAlign: TextAlign.center,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextButton(
                      onPressed: () {
                        // Navigasi ke halaman Ketentuan Layanan
                      },
                      child: Text(
                        'Ketentuan layanan',
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                    ),
                    Text(
                      ' dan ',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigasi ke halaman Kebijakan Privasi
                      },
                      child: Text(
                        'Kebijakan privasi',
                        style: TextStyle(color: Colors.blue, fontSize: 12),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
