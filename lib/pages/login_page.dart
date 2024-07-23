import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/components/my_coustombutton.dart';
import 'package:fooddeliveryapp/components/my_textfield.dart';
import 'package:fooddeliveryapp/pages/home_page.dart';
import 'package:fooddeliveryapp/services/auth_services.dart';

class LoginPage extends StatefulWidget {
  final void Function()? onTap;
  LoginPage({super.key, required this.onTap});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  // text editing controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  //firebase-----------------------------
  void login() async {
    // get instance of auth service
    final _authService = AuthService();

    // try sign in
    try {
      await _authService.signInWithEmailPassword(
          emailController.text, passwordController.text);
    }

    // display any errors
    catch (e) {
      showDialog(
          context: context,
          builder: (context) => AlertDialog(
                title: Text(e.toString()),
              ));
    }
    Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => HomePage(),
        ));
  }

  // //forgot pw
  // void forgotPw(){
  //   showDialog(context: context,
  //     builder: (context) => AlertDialog(
  //       backgroundColor: Theme.of(context).colorScheme.surface,
  //       title: const Text("User tapped forgot password"),
  //     ));

  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            //logo
            Icon(
              Icons.lock_open_rounded,
              size: 100,
              color: Theme.of(context).colorScheme.inversePrimary,
            ),

            const SizedBox(
              height: 25,
            ),
            //message ,app_slogan
            Text(
              "Food Deliver App",
              style: TextStyle(
                  fontSize: 16,
                  color: Theme.of(context).colorScheme.inversePrimary),
            ),
            const SizedBox(
              height: 25,
            ),
            //email textfield
            MyTextField(
                controller: emailController,
                hintText: " enter your email here",
                obscureText: false),

            const SizedBox(
              height: 25,
            ),
            //password textfied
            MyTextField(
                controller: passwordController,
                hintText: " password here",
                obscureText: false),
            const SizedBox(
              height: 25,
            ),

            //sign in button
            MyCoustomButton(
              text: "Login here",
              onTap: login,
            ),

            //not a member? register now
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Not a member?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(
                  width: 4,
                ),
                TextButton(
                    onPressed: widget.onTap,
                    child: Text(
                      "Register now",
                      style: TextStyle(
                          color: Theme.of(context).colorScheme.inversePrimary,
                          fontWeight: FontWeight.bold),
                    ))
              ],
            )
          ],
        ),
      ),
    );
  }
}
