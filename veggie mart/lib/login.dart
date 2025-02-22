import 'package:flutter/material.dart';
import 'homescreeno.dart'; // Ensure correct import
import 'widgets.dart';
import 'signup.dart'; // Import the registration screen
import 'user_state.dart';
import 'navbar1.dart'; // Ensure correct import

class SimpleLoginScreen extends StatefulWidget {
  final Function(String? email, String? password)? onSubmitted;

  const SimpleLoginScreen({this.onSubmitted, Key? key}) : super(key: key);

  @override
  State<SimpleLoginScreen> createState() => _SimpleLoginScreenState();
}

class _SimpleLoginScreenState extends State<SimpleLoginScreen> {
  late String email, password, username;
  String? emailError, passwordError, usernameError;
  Function(String? email, String? password)? get onSubmitted =>
      widget.onSubmitted;

  @override
  void initState() {
    super.initState();
    email = '';
    password = '';
    username = '';
    emailError = null;
    passwordError = null;
    usernameError = null;
  }

  void resetErrorText() {
    setState(() {
      emailError = null;
      passwordError = null;
      usernameError = null;
    });
  }

  bool validate() {
    resetErrorText();

    RegExp emailExp = RegExp(
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,253}[a-zA-Z0-9])?)*$");

    bool isValid = true;
    if (username.isEmpty) {
      setState(() {
        usernameError = 'Please enter a username';
      });
      isValid = false;
    }

    if (email.isEmpty || !emailExp.hasMatch(email)) {
      setState(() {
        emailError = 'Email is invalid';
      });
      isValid = false;
    }

    if (password.isEmpty) {
      setState(() {
        passwordError = 'Please enter a password';
      });
      isValid = false;
    }

    return isValid;
  }

  void submit() {
    if (validate()) {
      if (onSubmitted != null) {
        // Update the global user state
        UserState().setUserInfo(email, username);
        onSubmitted!(email, password);
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => MyHomePage(), // Ensure correct class name
          ),
        );
      }
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
                SizedBox(height: screenHeight * .1), // Adjusted for iPhone 13 Pro Max
                const Text(
                  'Welcome,',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: screenHeight * .01),
                Text(
                  'Sign in to continue!',
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.6),
                  ),
                ),
                SizedBox(height: screenHeight * .08),
                InputField(
                  onChanged: (value) {
                    setState(() {
                      username = value;
                    });
                  },
                  labelText: 'Username',
                  errorText: usernameError,
                  textInputAction: TextInputAction.next,
                  autoFocus: true,
                ),
                SizedBox(height: screenHeight * .02),
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
                ),
                SizedBox(height: screenHeight * .02),
                InputField(
                  onChanged: (value) {
                    setState(() {
                      password = value;
                    });
                  },
                  onSubmitted: (val) => submit(),
                  labelText: 'Password',
                  errorText: passwordError,
                  obscureText: true,
                  textInputAction: TextInputAction.done,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => const ForgotPassword(),
                        ),
                      );
                    },
                    child: const Text(
                      'Forgot Password?',
                      style: TextStyle(
                        color: Colors.black,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: screenHeight * .05),
                ElevatedButton(
                  onPressed: submit,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent, // Use backgroundColor instead of primary
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                  ),
                  child: const Text(
                    'Log In',
                    style: TextStyle(fontSize: 18, color: Colors.white),
                  ),
                ),
                SizedBox(height: screenHeight * .1),
                TextButton(
                  onPressed: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => const SimpleRegisterScreen(),
                    ),
                  ),
                  child: RichText(
                    text: const TextSpan(
                      text: "I'm a new user, ",
                      style: TextStyle(color: Colors.black),
                      children: [
                        TextSpan(
                          text: 'Sign Up',
                          style: TextStyle(
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

          ],
        ),
      ),
    );
  }
}

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({Key? key}) : super(key: key);

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

class _ForgotPasswordState extends State<ForgotPassword> {
  final _formKey = GlobalKey<FormState>();
  String? _email;

  void _handleResetLink() async {
    if (_formKey.currentState?.validate() == true) {
      // Show loading screen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const LoadingScreen(),
        ),
      );

      // Wait for 3 seconds
      await Future.delayed(const Duration(seconds: 3));

      // Close the loading screen
      Navigator.pop(context);

      // Navigate to ResetLinkSentScreen
      Navigator.push(
        context,
        MaterialPageRoute(
          builder: (_) => const ResetLinkSentScreen(),
        ),
      );
    }
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              children: [
                const SizedBox(height: 20),
                Align(
                  alignment: Alignment.topLeft,
                  child: TextButton.icon(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (_) => SimpleLoginScreen(), // Replace with your signup screen
                        ),
                      );
                    },

                    label: Container(
                      alignment: Alignment.center,
                      width: 120,
                      height: 35,
                      child: const Text(
                        'Return Home',
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Image.asset(
                      'assets/logo/forgot.gif',
                      fit: BoxFit.fill,
                      height: 400,
                      width: double.infinity,
                    ),
                  ),
                ),
                const SizedBox(height: 35),
                const Center(
                  child: Text(
                    'Send Reset Link to Email!',
                    style: TextStyle(
                      fontSize: 24,
                      color: Colors.blueAccent,
                      fontWeight: FontWeight.bold,
                      fontFamily: 'Courier',
                    ),
                  ),
                ),
                const SizedBox(height: 32),
                Form(
                  key: _formKey,
                  child: Column(
                    children: [
                      TextFormField(
                        decoration: InputDecoration(
                          hintText: 'Enter Your Email',
                          labelText: 'Email',
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return 'Please enter your email';
                          }
                          if (!RegExp(r'^[^@]+@[^@]+\.[^@]+').hasMatch(value)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                        onChanged: (value) {
                          setState(() {
                            _email = value;
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      Align(
                        alignment: Alignment.centerRight,
                        child: TextButton(
                          onPressed: _handleResetLink,
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                            backgroundColor: _formKey.currentState?.validate() == true
                                ? Colors.blueAccent
                                : Colors.grey,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                            ),
                            minimumSize: const Size(150, 45),
                          ),
                          child: Center(
                            child: _formKey.currentState?.validate() == true
                                ? const Text(
                              'Send Reset Link',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.white,
                              ),
                            )
                                : const Icon(
                              Icons.email_outlined,
                              size: 28,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class LoadingScreen extends StatelessWidget {
  const LoadingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              width: 100,
              height: 100,
              child: Image.asset(
                'assets/logo/sending.gif',
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              '  Sending Reset Link...',
              style: TextStyle(fontSize: 18, color: Colors.blueAccent),
            ),
          ],
        ),
      ),
    );
  }
}
class ResetLinkSentScreen extends StatelessWidget {
  const ResetLinkSentScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Reset Link Sent'),
        backgroundColor: Colors.blueAccent,
        elevation: 0,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 200,
                height: 200,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 5,
                      blurRadius: 7,
                      offset: const Offset(0, 3),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Image.asset(
                    'assets/logo/mail.gif',
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Link sent successfully!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 20),
              const Text(
                'Please check your email for the reset link.',
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 18),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
