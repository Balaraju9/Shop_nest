import 'package:flutter/material.dart';
import 'homescreeno.dart';
import 'login.dart';
import 'widgets.dart';
import 'navbar1.dart';
// Import the routes file

class SimpleRegisterScreen extends StatefulWidget {
  final Function(String? email, String? password)? onSubmitted;

  const SimpleRegisterScreen({this.onSubmitted, Key? key}) : super(key: key);

  @override
  State<SimpleRegisterScreen> createState() => _SimpleRegisterScreenState();
}

class _SimpleRegisterScreenState extends State<SimpleRegisterScreen> {
  late String email, password, confirmPassword;
  String? emailError, passwordError;
  Function(String? email, String? password)? get onSubmitted => widget.onSubmitted;

  @override
  void initState() {
    super.initState();
    email = '';
    password = '';
    confirmPassword = '';
    emailError = null;
    passwordError = null;
  }

  void resetErrorText() {
    setState(() {
      emailError = null;
      passwordError = null;
    });
  }

  bool validate() {
    resetErrorText();
    RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");
    bool isValid = true;
    if (email.isEmpty || !emailExp.hasMatch(email)) {
      setState(() {
        emailError = 'Email is invalid';
      });
      isValid = false;
    }
    if (password.isEmpty || confirmPassword.isEmpty) {
      setState(() {
        passwordError = 'Please enter a password';
      });
      isValid = false;
    }
    if (password != confirmPassword) {
      setState(() {
        passwordError = 'Passwords do not match';
      });
      isValid = false;
    }
    return isValid;
  }

  void submit() {
    if (validate()) {
      if (onSubmitted != null) {
        onSubmitted!(email, password);
      }
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) => navbar(), // Replace with your navbar screen
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        child: Stack(
          children: [
            ListView(
              children: [
                SizedBox(height: screenHeight * .12),
                const Text(
                  'Create Account,',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * .01),
                Text(
                  'Sign up to get started!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
                SizedBox(height: screenHeight * .12),
                InputField(
                  onChanged: (value) {
                    setState(() {
                      email = value;
                    });
                  },
                  labelText: 'Email',
                  errorText: emailError,
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  autoFocus: true,
                ),
                SizedBox(height: screenHeight * .025),
                InputField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  labelText: 'Password',
                  errorText: passwordError,
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                ),
                SizedBox(height: screenHeight * .025),
                InputField(
                  onChanged: (value) {
                    setState(() {
                      confirmPassword = value;
                    });
                  },
                  onSubmitted: (value) => submit(),
                  labelText: 'Confirm Password',
                  errorText: passwordError,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                ),
                SizedBox(height: screenHeight * .075),
                FormButton(
                  text: 'Sign Up',
                  onPressed: submit,
                ),
                SizedBox(height: screenHeight * .125),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SimpleLoginScreen(),
                    ),
                  ),
                  child: RichText(
                    text: const TextSpan(
                      text: "I'm already a member, ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Sign In',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * .075),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (_) => const ForgotPassword(),
                      ),
                    );
                  },
                  child: const Text('Forgot Password'),
                ),
              ],
            ),
            Positioned(
              top: 60.0,
              right: 16.0,
              child: ElevatedButton(
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => MyHomePage(), // Replace with your signup screen
                    ),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.transparent, // Transparent background
                  padding: EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0), // Adjust padding for small size
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.0), // Rounded corners
                  ),
                  elevation: 0, // No shadow
                ),
                child: Text(
                  'Become a Seller',
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.bold, color: Colors.blueAccent),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

