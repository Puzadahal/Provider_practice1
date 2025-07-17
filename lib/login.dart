import 'package:flutter/material.dart';
import 'package:practice/provider/confirm_passwordProvider.dart';
import 'package:practice/custom_text_form_field.dart';
import 'package:practice/provider/login_provider.dart';
import 'package:provider/provider.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});
  final _formKey = GlobalKey<FormState>();
  late String email, password, repeat_password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.lightBlue,
          title: Text(
            "Welcome ",
            style: TextStyle(
                fontSize: 25, fontWeight: FontWeight.bold, color: Colors.white),
              
          ),
          centerTitle: true,
        ),
        body: Consumer2<LoginProvider, ConfirmPasswordprovider>(
          builder: (context, loginProvider, confirmProvider, child) => Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  CustomTextformfield(
                    labelText: "Email ",
                    onChanged: (value) {
                      email = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                    },
                  ),
                  CustomTextformfield(
                    labelText: "Password",
                    // prefixIcon: Icon(Icons.lock),
                    obscureText: !loginProvider.showPassword,
                    onChanged: (value) {
                      password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      if (value.length < 6) {
                        return "Password must be at least 6 character";
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        loginProvider.togglePasswordVisibility();
                      },
                      icon: Icon(
                        loginProvider.showPassword
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  CustomTextformfield(
                    labelText: "Confirm Password",
                    obscureText: !confirmProvider.security,
                    onChanged: (value) {
                      repeat_password = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return "This field is required";
                      }
                      if (value != password) {
                        return "Passwords do not match";
                      }
                      return null;
                    },
                    suffixIcon: IconButton(
                      onPressed: () {
                        confirmProvider.ConfirmPassword();
                      },
                      icon: Icon(
                        confirmProvider.security
                            ? Icons.visibility
                            : Icons.visibility_off,
                      ),
                    ),
                  ),
                  const SizedBox(height: 20),
                  ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.lightBlue,
                        padding: EdgeInsets.symmetric(
                            horizontal: 40, vertical: 12),
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(content: Text('Form is valid')),
                          );
                        }
                      },
                      child: Text(
                        "Submit",
                        style: TextStyle(color: Colors.white),
                      ))
                ],
              ),
            ),
          ),
        ));
  }
}
