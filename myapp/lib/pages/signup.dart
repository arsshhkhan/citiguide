
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/components/widgets.dart';
import 'package:myapp/pages/homepage.dart';
import 'package:myapp/pages/login.dart';

class Signup extends StatefulWidget {
  const Signup({super.key});

  @override
  State<Signup> createState() => _SignupState();
}

class _SignupState extends State<Signup> { 
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _signupForm() {
    if (_formKey.currentState!.validate()) {
      // Implement signup logic here
      print("Name: ${_nameController.text}");
      print("Email: ${_emailController.text}");
      print("Password: ${_passwordController.text}");
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    }
  }

  void _navigateToLogin() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Login(),
        ));
  }

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 650,
          width: 350,
          child: Form(
            key: _formKey,
            child: Card(
              elevation: 20,
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  verticalDirection: VerticalDirection.down,
                  children: [
                    Container(
                      height: 150.0,
                      width: 150.0,
                      child: Image.asset('assets/images/log.png', fit: BoxFit.cover),
                    ),
                    SizedBox(height: 20),
                    textfield(
                      controller: _nameController,
                      label: "Name",
                      icon: Icons.person,
                      obs: false,
                      iconColor: Colors.blue,
                    ),
                    SizedBox(height: 20),
                    textfield(
                      controller: _emailController,
                      label: "Email",
                      icon: Icons.email,
                      obs: false,
                      iconColor: Colors.blue,
                    ),
                    SizedBox(height: 20),
                    textfield(
                      controller: _passwordController,
                      label: "Password",
                      icon: Icons.password,
                      obs: true,
                      iconColor: Colors.blue,
                    ),
                    SizedBox(height: 20),
                    materialbutton(
                      function: _signupForm,
                      btnText: "Sign Up",
                      btnColor: Color.fromARGB(255, 12, 122, 247),
                    ),
                    SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("Already have an account? "),
                        textbutton(text: "Login", function: _navigateToLogin),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
