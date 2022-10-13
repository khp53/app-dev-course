import 'package:firebase/screens/auth/signin.dart';
import 'package:firebase/services/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignUP extends StatefulWidget {
  const SignUP({super.key});

  @override
  State<SignUP> createState() => _SignUPState();
}

class _SignUPState extends State<SignUP> {
  // Email controller
  final email = TextEditingController();
  // Pass controller
  final password = TextEditingController();

  final FirebaseAuthServices _firebaseAuthServices = FirebaseAuthServices();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign Up"),
      ),
      body: Container(
        margin: const EdgeInsets.all(25),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              "Sign Up!",
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
                var respose = await _firebaseAuthServices.signUp(
                  email.text.trim(),
                  password.text.trim(),
                );
                if (respose != null) {
                  // ignore: use_build_context_synchronously
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                      content: Text("Account Created"),
                    ),
                  );
                }
              },
              color: Colors.lightBlue,
              child: const Text("Sign Up"),
            ),
            const SizedBox(
              height: 20,
            ),
            TextButton(
              onPressed: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => const SignIn(),
                ),
              ),
              child: const Text("Sign In Here!"),
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
