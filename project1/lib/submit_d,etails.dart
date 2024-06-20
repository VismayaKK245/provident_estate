


import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:project1/second_screen.dart';

import 'api_service.dart';

class LoginContainer extends StatelessWidget {
   final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
   LoginContainer({Key? key, required this.isSignUp, required this.toggleFormType}) : super(key: key);

  final bool isSignUp;
  final VoidCallback toggleFormType;

  final TextEditingController fullNameController = TextEditingController();
  final TextEditingController phoneNumberController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();

 String? _validateFullName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your full name';
    }
    return null;
  }

  String? _validatePhoneNumber(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your phone number';
    }
    // You can add more specific validation logic here if needed
    return null;
  }

  String? _validateEmail(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter your email';
    }
    if (!value.contains('@')) {
      return 'Please enter a valid email';
    }
    return null;
  }

  String? _validatePassword(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter a password';
    }
    if (value.length < 6) {
      return 'Password must be at least 6 characters long';
    }
    return null;
  }

  String? _validateConfirmPassword(String? value) {
    if(value == null || value.isEmpty) {
      return 'Please re-enter the password';
    }
    else if (value != passwordController.text ) {
      return 'Passwords do not match';
    }
    return null;
  }


 void _handleSubmit(BuildContext context) async {
  if (_formKey.currentState!.validate()) {
    if (isSignUp) {
      final response = await ApiService.signUp(
        fullNameController.text,
        phoneNumberController.text,
        emailController.text,
        passwordController.text,
      );
     if (response.statusCode == 200 || response.statusCode == 201) {
    // Successful registration
    print('Sign up successful: ${response.body}');
    // Navigate to SecondHomePage
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => GalleryAccess()),
    );
} else {
    // Handle other status codes
    print('Sign up failed with status code ${response.statusCode}: ${response.body}');
    // Handle sign up failure
}

    } else {
      final response = await ApiService.signIn(
        emailController.text,
        passwordController.text,
      );
      if (response.statusCode == 200) {
        // Successful login
        print('Sign in successful: ${response.body}');
        // Navigate to SecondHomePage
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => GalleryAccess()),
        );
      } else {
        // Handle other status codes
        print('Sign in failed with status code ${response.statusCode}: ${response.body}');
        // Handle sign in failure
      }
    }
  }
}


  @override
  Widget build(BuildContext context) {
    return Container(
      height: 700,
      width: MediaQuery.of(context).size.width,
      color: Color.fromARGB(255, 227, 243, 249),
      child: Padding(
        padding: const EdgeInsets.only(left: 20.0, right: 120),
        child: Row(
          children: [
            Expanded(
              flex: 2,
              child: Padding(
                padding: const EdgeInsets.only(left: 20.0, top: 100),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    AutoSizeText(
                      'Speak with our Real Estate\nspecialists today',
                      style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: Color.fromARGB(255, 9, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 10),
                    const AutoSizeText(
                      'Get in touch for tailored guidance from our expert team. We are\ncommitted to assisting you through each phase of your journey.',
                      style: TextStyle(
                        fontSize: 16,
                        color: Color.fromARGB(255, 1, 0, 0),
                      ),
                    ),
                    const SizedBox(height: 60),
                    Row(
                      children: [
                        Icon(Icons.phone, color: Colors.black, size: 25),
                        const SizedBox(width: 5),
                        Text(
                          '123-456-7890',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.email, color: Colors.black, size: 25),
                        const SizedBox(width: 5),
                        Text(
                          'example@example.com',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Row(
                      children: [
                        Icon(Icons.message, color: Colors.black, size: 25),
                        const SizedBox(width: 5),
                        Text(
                          'WhatsApp',
                          style: TextStyle(fontSize: 25, color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Padding(
                padding: const EdgeInsets.only(top: 60.0, left: 50),
                child: Container(
                  color: Colors.white,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          if (isSignUp)
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, right: 15, left: 15),
                              child: TextFormField(
                                controller: fullNameController,
                                decoration: InputDecoration(
                                  labelText: 'Full Name',
                                  border: OutlineInputBorder(),
                                ),
                                validator: _validateFullName,
                              ),
                            ),
                          if (isSignUp)
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, right: 15, left: 15),
                              child: TextFormField(
                                controller: phoneNumberController,
                                decoration: InputDecoration(
                                  labelText: 'Phone Number',
                                  border: OutlineInputBorder(),
                                ),
                                validator: _validatePhoneNumber,
                              ),
                            ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0, right: 15, left: 15),
                            child: TextFormField(
                              controller: emailController,
                              decoration: InputDecoration(
                                labelText: 'Email Id',
                                border: OutlineInputBorder(),
                              ),
                              validator: _validateEmail,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                top: 30.0, right: 15, left: 15),
                            child: TextFormField(
                              controller: passwordController,
                              decoration: InputDecoration(
                                labelText: 'Password',
                                border: OutlineInputBorder(),
                              ),
                              obscureText: true,
                              validator: _validatePassword,
                            ),
                          ),
                          if (isSignUp)
                            Padding(
                              padding: const EdgeInsets.only(
                                  top: 30.0, right: 15, left: 15),
                              child: TextFormField(
                                controller: confirmPasswordController,
                                decoration: InputDecoration(
                                  labelText: 'Confirm Password',
                                  border: OutlineInputBorder(),
                                ),
                                obscureText: true,
                                validator: _validateConfirmPassword,
                              ),
                            ),
                         Padding(
  padding: const EdgeInsets.only(
    top: 30.0,
    right: 15,
    left: 15,
    bottom: 10,
  ),
  child: ElevatedButton(
    onPressed: () => _handleSubmit(context), // Pass context to _handleSubmit
    child: Text(
      isSignUp ? 'SIGN UP' : 'SIGN IN',
      style: TextStyle(color: Colors.white),
    ),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(
        const Color.fromARGB(255, 243, 100, 33),
      ),
      padding: MaterialStateProperty.all<EdgeInsetsGeometry>(
        EdgeInsets.all(15),
      ),
      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
        RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(0.0),
        ),
      ),
      minimumSize: MaterialStateProperty.all<Size>(Size(350, 50)),
    ),
  ),
),
Padding(
  padding: const EdgeInsets.only(
    top: 10.0,
    right: 15,
    left: 15,
    bottom: 10,
  ),
  child: TextButton(
    onPressed: toggleFormType,
    child: Text(
      isSignUp
          ? 'Already have an account? Sign in'
          : 'Don\'t have an account? Sign up',
      style: TextStyle(
        color: Color.fromARGB(255, 243, 100, 33),
        fontSize: 16,
      ),
    ),
  ),
),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
