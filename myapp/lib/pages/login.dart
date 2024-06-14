
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:myapp/components/widgets.dart';
import 'package:myapp/pages/review_page.dart';
import 'package:myapp/pages/signup.dart';
import 'package:myapp/pages/login.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  void _loginForm() {
    if (_formKey.currentState!.validate()) {
      print(_emailController.text);
      print(_passwordController.text);
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => HomePage(),
          ));
    }
  }

  void _navigateToSignup() {
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => Signup(),
        ));
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
          height: 570,
          width: 350,
          child: Card(
            elevation: 20,
            child: Column(
              children: [
                Center(
                  child: Container(
                    height: 150.0,
                    width: 150.0,
                    margin: EdgeInsets.only(top: 20.0),
                    child: Image.asset(
                      'assets/images/log.png',
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Form(
                  key: _formKey,
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(50, 20, 50, 0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        textfield(
                          controller: _emailController,
                          label: "Email",
                          icon: Icons.email,
                          obs: false,
                        ),
                        sizedbox(),
                        textfield(
                          controller: _passwordController,
                          label: "Password",
                          icon: Icons.password,
                          obs: true,
                        ),
                        sizedbox(),
                        materialbutton(
                          function: _loginForm,
                          btnText: "Login",
                          btnColor: Colors.blue,
                        ),
                        sizedbox(),
                        Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?"),
                              textbutton(
                                text: "Sign up",
                                function: _navigateToSignup,
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
