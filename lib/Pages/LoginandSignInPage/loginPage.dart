import 'package:flutter/material.dart';
import 'package:mini_1/Data/dimensions.dart';
import 'package:mini_1/Pages/homePage.dart';
import 'package:mini_1/Widgets/LongRoundedButton.dart';

class loginScreen extends StatelessWidget {
  final TextEditingController enrollmentController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _login(BuildContext context) {
    // Add your login logic here
    String enrollmentNumber = enrollmentController.text;
    String password = passwordController.text;

    // Validate login credentials and perform login actions
    if (enrollmentNumber.isNotEmpty && password.isNotEmpty) {
      print("Enrollment Number: $enrollmentNumber");
      print("Password: $password");
      Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (ctx) {
        return homePage();
      }));
    } else {
      // Handle invalid login
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text("Invalid Login"),
            content: Text("Please enter valid credentials."),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop();
                },
                child: Text("OK"),
              ),
            ],
          );
        },
      );
    }
  }

  final FocusNode enrollmentFocus = FocusNode();
  final FocusNode passwordFocus = FocusNode();

  void _dismissKeyboard() {
    // Unfocus both text fields to dismiss the keyboard
    enrollmentFocus.unfocus();
    passwordFocus.unfocus();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: _dismissKeyboard,
        child: Center(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Container(
              color: Colors.white60, // Red container background
              padding: EdgeInsets.all(20.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Image.asset(
                    "assets/images/PlaceHolder.png",
                    height: 200,
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextField(
                    controller: enrollmentController,
                    focusNode: enrollmentFocus,
                    decoration: const InputDecoration(
                      hintText: 'MITU21BTCS...',
                      floatingLabelBehavior: FloatingLabelBehavior.always,
                      labelText: "Enrollment Number",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  TextField(
                    focusNode: passwordFocus,
                    controller: passwordController,
                    obscureText: true,
                    decoration: const InputDecoration(
                      labelText: "Password",
                      border: OutlineInputBorder(),
                    ),
                  ),
                  const SizedBox(height: 20.0),
                  longRoundBtn(
                    onPressed: () => _login(context),
                    text: 'Login',
                    width: getDimensionWidth(context) * (8 / 9),
                  ),
                  const SizedBox(height: 10.0),
                  TextButton(
                    onPressed: () {
                      // Add navigation to the registration page or your "Create an account" logic here.
                      print("Create an account button pressed");
                    },
                    child: const Text("Create an account"),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
