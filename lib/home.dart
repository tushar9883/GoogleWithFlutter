import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:googlewithlogin/api/google_signin_api.dart';
import 'package:googlewithlogin/login/login_google.dart';

class HomePage extends StatefulWidget {
  final GoogleSignInAccount user;

  const HomePage({Key? key, required this.user}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            widget.user.photoUrl != null
                ? Center(
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(60),
                      child: SizedBox(
                          height: 120,
                          width: 120,
                          child: Image.network("${widget.user.photoUrl}")),
                    ),
                  )
                : const FlutterLogo(size: 40),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Name: ${widget.user.displayName}",
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(
              height: 20,
            ),
            Text(
              "Email: ${widget.user.email}",
              style: const TextStyle(fontSize: 16, color: Colors.black),
            ),
            const SizedBox(
              height: 60,
            ),
            InkWell(
              onTap: () async {
                await GoogleSignInApi.logout();
                Navigator.of(context).pushReplacement(
                  MaterialPageRoute(
                    builder: (context) => const LoginGoogle(),
                  ),
                );
              },
              child: Container(
                padding: const EdgeInsets.all(10),
                height: 60,
                width: 60,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  color: Colors.amberAccent,
                ),
                child: Image.asset(
                  "assets/images/logout.png",
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
