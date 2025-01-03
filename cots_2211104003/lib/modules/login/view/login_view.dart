import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/login_controller.dart';

class LoginView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final LoginController controller = Get.put(LoginController());

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment:
                CrossAxisAlignment.start, // Align text to the left
            children: [
              // Centering the logo
              Center(
                child: Image.asset(
                  'assets/images/logo_gojek.png',
                  height: 80, // Adjust the height as needed
                ),
              ),
              SizedBox(height: 20),
              // Align the "Login" text to the left
              Text(
                'Login',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 10),
              // Align the description text to the left
              Text(
                'Enter your registered phone number to log in',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: 30),
              // Phone number text field
              TextField(
                keyboardType: TextInputType.phone,
                onChanged: (value) => controller.username.value = value,
                decoration: InputDecoration(
                  labelText: 'Phone number',
                  prefixIcon: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 8.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text('+62', style: TextStyle(fontSize: 16)),
                        VerticalDivider(thickness: 1, color: Colors.grey),
                      ],
                    ),
                  ),
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
              ),
              SizedBox(height: 10),
              TextButton(
                onPressed: () {},
                child: Text(
                  'Login with email?',
                  style: TextStyle(color: Colors.green),
                ),
              ),
              SizedBox(height: 20),
              // Center the Continue button
              Center(
                child: Obx(() => controller.isLoading.value
                    ? CircularProgressIndicator()
                    : ElevatedButton(
                        onPressed: controller.login,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.green,
                          padding: EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 50.0), // Wider button
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15.0),
                          ),
                        ),
                        child: Text(
                          'Continue',
                          style: TextStyle(fontSize: 16.0, color: Colors.white),
                        ),
                      )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
