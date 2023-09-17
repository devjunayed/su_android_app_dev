import 'package:flutter/material.dart';
import 'package:su_android_learning/hw_images.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class HWLogin extends StatefulWidget {
  const HWLogin({super.key});

  @override
  State<HWLogin> createState() => _HWLoginState();
}

Future<List<dynamic>> fetchData() async {
  final res = await http.get(Uri.parse('https://raw.githubusercontent.com/devjunayed/test_api/main/image.json'));

  if (res.statusCode == 200) {
    final List<dynamic> data = json.decode(res.body);
    return data;
  } else {
    throw Exception('Failed to load data');
  }
}

class _HWLoginState extends State<HWLogin> {
  final String email = "junayed@gmail.com";
  final String password = "junayed";

  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          key: _formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'This field is required';
                  }
                  return null;
                },
                controller: _emailController,
                decoration: const InputDecoration(
                  hintText: "Enter your email",
                  icon: Icon(Icons.person),
                  border: OutlineInputBorder(),
                ),
              ),
              const SizedBox(
                height: 8.0,
              ),
              TextFormField(
                validator: (value) {
                  if (value!.isEmpty) {
                    return "This field is required!";
                  } else if (!(value.length >= 6)) {
                    return "Password showed be more 6 characeters";
                  }
                  return null;
                },
                obscureText: true,
                controller: _passwordController,
                decoration: const InputDecoration(
                    icon: Icon(Icons.password_outlined),
                    hintText: "Enter your password",
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 8.0,
              ),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate() &&
                      _emailController.text == email &&
                      _passwordController.text == password) {
                    final data = await fetchData();
                    if (!context.mounted) return;
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ShowImages(data: data),
                      ),
                    );
                  } else {
                    final snackBar = SnackBar(
                        content: const Text('No user found!'),
                        action: SnackBarAction(
                          label: 'x',
                          onPressed: () {},
                        ));

                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                  }
                },
                child: const Text("Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
