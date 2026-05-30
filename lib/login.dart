import 'package:flutter/material.dart';
import 'dashboard.dart';

class Login extends StatefulWidget {
  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController pinController = TextEditingController();

  void login() {
    String username = usernameController.text.trim();
    String pin = pinController.text.trim();

    const String correctUsername = "pedro";
    const String correctPin = "1234";

    if (username.isEmpty || pin.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Please fill up all missing fields.")),
      );
      return;
    }

    if (username == correctUsername && pin == correctPin) {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Login Successful")));

      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (context) => DashboardScreen(username: username),
        ),
      );
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(SnackBar(content: Text("Invalid username or PIN")));
    }
  }

  void forgotPassword() {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(SnackBar(content: Text("ADMIN CHECK HIM PC")));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ListView(
          shrinkWrap: true,
          padding: EdgeInsets.symmetric(horizontal: 24),
          children: [
            Text(
              "Pedro's Bank",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 60.0,
                fontWeight: FontWeight.bold,
                color: Colors.blue,
              ),
            ),

            SizedBox(height: 30),

            TextField(
              controller: usernameController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(hintText: "USERNAME"),
            ),

            SizedBox(height: 15),

            TextField(
              controller: pinController,
              obscureText: true,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(hintText: "PIN"),
            ),

            SizedBox(height: 20),

            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextButton(onPressed: login, child: Text("Login")),
                TextButton(
                  onPressed: forgotPassword,
                  child: Text("Forgot Password"),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
