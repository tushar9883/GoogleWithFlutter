import 'package:flutter/material.dart';
import 'package:googlewithlogin/api/google_signin_api.dart';
import 'package:googlewithlogin/home.dart';

class LoginGoogle extends StatefulWidget {
  const LoginGoogle({Key? key}) : super(key: key);

  @override
  State<LoginGoogle> createState() => _LoginGoogleState();
}

class _LoginGoogleState extends State<LoginGoogle> {
  singin() async {
    final user = await GoogleSignInApi.login();
    if (user == null) {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text("Sign in Failed"),
        ),
      );
    } else {
      Navigator.of(context).pushReplacement(
        MaterialPageRoute(
          builder: (context) => HomePage(user: user),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: const EdgeInsets.symmetric(horizontal: 50),
              padding: const EdgeInsets.all(3),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(
                  Radius.circular(2),
                ),
                color: Color(0xff4285F4),
              ),
              child: InkWell(
                onTap: () {
                  singin();
                },
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(8),
                      height: 40,
                      width: 40,
                      color: Colors.white,
                      child: Image.asset(
                        "assets/images/google.png",
                      ),
                    ),
                    const SizedBox(
                      width: 30,
                    ),
                    const Text(
                      "Sign in with Google",
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
