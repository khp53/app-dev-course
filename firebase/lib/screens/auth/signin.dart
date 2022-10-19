import 'package:firebase/screens/auth/signup.dart';
import 'package:firebase/screens/home/home.dart';
import 'package:firebase/services/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  // Email controller
  final email = TextEditingController();
  // Pass controller
  final password = TextEditingController();

  final FirebaseAuthServices _firebaseAuthServices = FirebaseAuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign In!",
              style: TextStyle(
                fontSize: 35,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            customTextField(
              email,
              (val) {
                if (val!.isEmpty) {
                  return "Please fill up this field!";
                } else {
                  return null;
                }
              },
              false,
              "Enter your email",
            ),
            const SizedBox(
              height: 30,
            ),
            customTextField(
              password,
              (val) {
                if (val!.isEmpty) {
                  return "Please fill up this field!";
                } else {
                  return null;
                }
              },
              true,
              "Enter your password",
            ),
            const SizedBox(
              height: 30,
            ),
            MaterialButton(
              minWidth: MediaQuery.of(context).size.width,
              onPressed: () async {
                var respose = await _firebaseAuthServices.signIn(
                  email.text.trim(),
                  password.text.trim(),
                  context,
                );
                if (respose != null) {
                  // ignore: use_build_context_synchronously
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const Home(),
                    ),
                  );
                }
              },
              color: Colors.lightBlue,
              child: const Text("Sign In"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SignUP(),
                ),
              ),
              child: const Text("Sign Up Here!"),
            )
          ],
        ),
      ),
    );
  }

  TextFormField customTextField(
    TextEditingController controller,
    String? Function(String?)? validator,
    bool isObscured,
    String hint,
  ) {
    return TextFormField(
      controller: controller,
      validator: validator,
      obscureText: isObscured,
      decoration: InputDecoration(
        hintText: hint,
      ),
    );
  }
}
