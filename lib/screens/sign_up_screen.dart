import 'package:flutter/material.dart';
import 'package:supabase_auth/supabase_state/auth_state.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({Key? key}) : super(key: key);

  @override
  _SignUpScreenState createState() => _SignUpScreenState();
}

class _SignUpScreenState extends AuthState<SignUpScreen> {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        resizeToAvoidBottomInset: true,
        body: SizedBox(
          height: 768,
          width: 375,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    child: Container(
                      height: 587,
                      width: 375,
                      margin: const EdgeInsets.only(top: 68, bottom: 113),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Container(
                              height: 34,
                              width: 264,
                              margin: const EdgeInsets.only(
                                left: 15,
                                right: 16,
                              ),
                              child: const Text(
                                "MedRemind",
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 26,
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 70.0,
                              child: Image.asset(
                                "assets/images/logo.png",
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.only(
                                left: 16,
                                top: 28,
                                right: 16,
                              ),
                              child: Container(
                                width: 343,
                                decoration: BoxDecoration(
                                  color: Colors.white70,
                                  borderRadius: BorderRadius.circular(
                                    5,
                                  ),
                                  border: Border.all(
                                    color: Colors.blue.shade50,
                                    width: 1,
                                  ),
                                ),
                                child: TextFormField(
                                  controller: emailController,
                                  decoration: InputDecoration(
                                      hintText: "Enter your email",
                                      hintStyle: TextStyle(
                                          fontSize: 12.0,
                                          color: Colors.blueGrey.shade300),
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          5,
                                        ),
                                        borderSide: const BorderSide(
                                            color: Colors.white70),
                                      ),
                                      focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(
                                          5,
                                        ),
                                        borderSide: const BorderSide(
                                            color: Colors.white70),
                                      ),
                                      prefixIcon: const Padding(
                                        padding: EdgeInsets.all(
                                          15,
                                        ),
                                        child: Icon(Icons.email_outlined),
                                      ),
                                      filled: true,
                                      fillColor: Colors.white),
                                  style: TextStyle(
                                      color: Colors.blueGrey.shade300,
                                      fontSize: 14.0,
                                      fontFamily: 'Poppins',
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                            Container(
                              width: 343,
                              height: 48,
                              margin: const EdgeInsets.only(
                                left: 16,
                                top: 8,
                                right: 16,
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white70,
                                borderRadius: BorderRadius.circular(
                                  5,
                                ),
                                border: Border.all(
                                  color: Colors.blue.shade50,
                                  width: 1,
                                ),
                              ),
                              child: TextFormField(
                                controller: passwordController,
                                obscureText: true,
                                decoration: InputDecoration(
                                    hintText: "Enter Password",
                                    hintStyle: TextStyle(
                                        fontSize: 12.0,
                                        color: Colors.blueGrey.shade300),
                                    enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                      borderSide: const BorderSide(
                                          color: Colors.white70),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(
                                        5,
                                      ),
                                      borderSide: const BorderSide(
                                          color: Colors.white70),
                                    ),
                                    prefixIcon: const Padding(
                                      padding: EdgeInsets.all(
                                        15,
                                      ),
                                      child: Icon(Icons.lock_outline_rounded),
                                    ),
                                    filled: true,
                                    fillColor: Colors.white),
                                style: TextStyle(
                                    color: Colors.blueGrey.shade300,
                                    fontSize: 14.0,
                                    fontFamily: 'Poppins',
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                onTapBtnSignUp();
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(
                                  left: 16,
                                  top: 18,
                                  right: 16,
                                ),
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: Colors.blue,
                                    borderRadius: BorderRadius.circular(
                                      5,
                                    ),
                                    border: Border.all(
                                      color: Colors.white,
                                      width: 1,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  height: 57,
                                  width: 343,
                                  child: const Text(
                                    "Sign Up",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Colors.white,
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacementNamed(context, '/');
                              },
                              child: Container(
                                width: 212,
                                margin: const EdgeInsets.only(
                                  left: 81,
                                  top: 8,
                                  right: 82,
                                ),
                                child: RichText(
                                    text: TextSpan(children: <InlineSpan>[
                                      TextSpan(
                                        text: "Already have an account?",
                                        style: TextStyle(
                                            color: Colors.blueGrey.shade300,
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w400),
                                      ),
                                      TextSpan(
                                        text: ' ',
                                        style: TextStyle(
                                            color: Colors.indigo.shade300,
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700),
                                      ),
                                      TextSpan(
                                        text: "SignIn",
                                        style: TextStyle(
                                            color: Colors.lightBlue.shade300,
                                            fontSize: 12,
                                            fontFamily: 'Poppins',
                                            fontWeight: FontWeight.w700),
                                      )
                                    ]),
                                    textAlign: TextAlign.center),
                              ),
                            )
                          ]),
                    ),
                  ),
                )
              ]),
        ),
      ),
    );
  }

  void onTapBtnSignUp() async {
    final response = await Supabase.instance.client.auth
        .signUp(emailController.text, passwordController.text);
    if (response.error != null) {
      final snackbar = SnackBar(content: Text(response.error!.message));
      ScaffoldMessenger.of(context).showSnackBar(snackbar);
    } else {
      Navigator.pushReplacementNamed(context, '/dashboard');
    }
  }
}
