

import 'package:demo_app/screens/connect_screen.dart';
import 'package:demo_app/screens/signin_screen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  // final AuthViewModel authViewModel;

  final isButtonEnabled = ValueNotifier<bool>(true);
  var passwordVisible = false;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();
  var confirmPassController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    // final facebookState = authViewModel.facebookState;
    // final loginManager = authViewModel.facebookLoginManger;
    // final callbackManager = CallbackManager();
    // final launcherFacebook = (List<String> permissions) {
    //   // implement the launching logic for Facebook
    // };
    //
    // final googleSignInState = authViewModel.googleState;
    // final launcherGoogle = (Map<String, dynamic> result) {
    //   // implement the launching logic for Google
    // };

    // final signInState = signInViewModel.signInUiState.value;


    return Scaffold(
      backgroundColor: const Color(0xFFF4F0F8),
      body:
      Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          // crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const Text("Welcome,", style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.w300, fontSize: 22.0)),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text("Create", style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.normal, fontSize: 28.0, color: Color(0xFF8D8BC5))),
                Text(" An Account", style: TextStyle(fontFamily: 'Kanit', fontWeight: FontWeight.normal, fontSize: 28.0)),
              ],
            ),
            const SizedBox(height: 30.0),
            TextField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              //onChanged: (value) => signInViewModel.onEvent(SignUpUiEvent.EmailChange(value)),
              decoration: InputDecoration(
                labelText: "Email",
                prefixIcon: const Icon(Icons.email_outlined),
                // errorText: !signInViewModel.signInUiState.value.emailError ? "Invalid email address." : null,
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              ),
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: passwordController,
              //onChanged: (value) => signInViewModel.onEvent(SignUpUiEvent.PasswordChange(value)),
              decoration: InputDecoration(
                labelText: "Password",
                prefixIcon: const Icon(Icons.lock_outline),
                suffixIcon: IconButton(
                  onPressed: () => passwordVisible = !passwordVisible,
                  icon: IconButton(onPressed: (){

                    setState(() {
                      passwordVisible = !passwordVisible;
                    });
                  },
                      icon: Icon(passwordVisible? Icons.visibility_outlined : Icons.visibility_off_outlined)),
                ),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              ),
              obscureText: !passwordVisible,
            ),
            const SizedBox(height: 12.0),
            TextField(
              controller: confirmPassController,
              //onChanged: (value) => signInViewModel.onEvent(SignUpUiEvent.PasswordChange(value)),
              decoration: InputDecoration(
                labelText: "Confirm password",
                prefixIcon: const Icon(Icons.lock_outline),
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(12.0)),
              ),
            ),
            const SizedBox(height: 40.0),
            ElevatedButton(
              onPressed: () async {
                // isButtonEnabled.value = false;
                // await authViewModel.loginUser(signInState.email, signInState.password);
                // isButtonEnabled.value = true;

                ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                  content: Text("Sign up successful"),
                  duration: Durations.medium1,
                ));
                Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false);
              },
              style: ElevatedButton.styleFrom(
                minimumSize: const Size(160, 40),
                backgroundColor: const Color(0xFF8D8BC5),
              ),
              child:const Text("Sign Up", style: TextStyle(fontSize: 15.0, color: Color(0xFFF4F0F8))
              ),
            ),
            const SizedBox(height: 5.0),
            RichText(

              text: TextSpan(
                style: DefaultTextStyle.of(context).style,
                children: [
                  TextSpan(
                    text: "Don't have an account?  ",
                    style: TextStyle(decoration: TextDecoration.none,color: Theme.of(context).textTheme.bodyLarge?.color, fontSize: 16.0, fontFamily: 'Kanit', fontWeight: FontWeight.w300),

                  ),
                  TextSpan(
                    text: "Sign In",
                    style: const TextStyle(decoration: TextDecoration.none,fontSize: 16.0, fontFamily: 'Kanit', fontWeight: FontWeight.w400, color: Color(0xFF8D8BC5)),
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {

                        Navigator.pushReplacement(
                            context,
                            PageRouteBuilder(
                              pageBuilder: (_, __, ___) => const SignInScreen(),
                              transitionDuration: const Duration(milliseconds: 500),
                              transitionsBuilder: (_, animation, __, child) {
                                const begin = Offset(1.0, 0.0); // Entering from right
                                const end = Offset(0.0, 0.0); // Exiting to left
                                var tween = Tween(begin: begin, end: end);
                                var offsetAnimation = animation.drive(tween);

                                return SlideTransition(position: offsetAnimation, child: child);
                              },
                            )

                        );
                        // Navigator.push(
                        //   context,
                        //   MaterialPageRoute(builder: (context) => const Homepage())
                        // );
                      },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ConnectWith extends StatelessWidget {
  final VoidCallback onSignInWithGoogle;
  final VoidCallback onSignInWithFacebook;

  const ConnectWith({super.key,
    required this.onSignInWithGoogle,
    required this.onSignInWithFacebook,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: onSignInWithGoogle,
          icon: Image.asset("assets/images/ic_google.png", height: 20,),
          iconSize: 30.0,
        ),
        const SizedBox(width: 16.0),
        IconButton(
          onPressed: onSignInWithFacebook,
          icon: Image.asset("assets/images/ic_facebook.png", height: 20),
          iconSize: 30.0,
        ),
      ],
    );
  }
}
