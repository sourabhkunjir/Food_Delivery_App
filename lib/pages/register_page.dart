import 'package:flutter/material.dart';
import 'package:fooddeliveryapp/components/my_coustombutton.dart';
import 'package:fooddeliveryapp/components/my_textfield.dart';
import 'package:fooddeliveryapp/services/auth_services.dart';

class RegisterPage extends StatefulWidget {
  final void Function()? onTap;
  RegisterPage({super.key, required this.onTap});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  // text editing controllers
  final TextEditingController emailController = TextEditingController();

  final TextEditingController passwordController = TextEditingController();

  final TextEditingController confirmPasswordController = TextEditingController();

  // firebase --------------------------------
  void register() async {
    //get auth service
    final _authService = AuthService();

    // check if password match -> create user
    if (passwordController.text == confirmPasswordController.text) {
      // try creating user
      try {
        await _authService.signUpWithEmailPassword(
          emailController.text,
          passwordController.text,
        );
      }
      //displaying any errors
      catch (e) {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text(e.toString()),
          ),
        );
      }
    }

    // if passwords don,t match -> show error
    else {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(title: Text("password don't match!")),
        // builder: (context) => AlertDialog(title: Text("password don't match!")),
      );
    }
  }
  //-------------------------------------

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
              "Let's create an account for you!",
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

            //password textfied
            MyTextField(
                controller: confirmPasswordController,
                hintText: " confirm password here",
                obscureText: false),
            const SizedBox(
              height: 25,
            ),

            //sign up button
            MyCoustomButton(
              text: "Sign up here",
              onTap: register,
            ),

            //Already have an account ? Login here
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  "Already have an account?",
                  style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary),
                ),
                const SizedBox(
                  width: 4,
                ),
                TextButton(
                  onPressed: widget.onTap,
                  child: Text(
                    "Login here",
                    style: TextStyle(
                        color: Theme.of(context).colorScheme.inversePrimary,
                        fontWeight: FontWeight.bold),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
