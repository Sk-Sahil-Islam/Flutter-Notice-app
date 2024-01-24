import 'package:demo_app/screens/signin_screen.dart';
import 'package:demo_app/screens/signup_screen.dart';
import 'package:flutter/material.dart';

class ConnectScreen extends StatelessWidget {
  const ConnectScreen({super.key});

  // final NavController navController;
  // final AuthViewModel authViewModel;
  //
  // ConnectScreen({
  //   required this.navController,
  //   this.authViewModel = AuthViewModel(),
  // });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F0F8),
      body: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const SizedBox(height: 24.0),
            const ImageCard(),
            const SizedBox(height: 30.0),
            // if (authViewModel.googleSignInState is Resource.Loading ||
            //     authViewModel.facebookState is Resource.Loading)
            //   CircularProgressIndicator(
            //     color: Theme.of(context).primaryColor,
            //   ),
            const SizedBox(height: 8.0),
            const Row(
              children: [
                Text(
                  "Let others ",
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.normal,
                    fontSize: 30.0,
                  ),
                ),
                Text(
                  "know.",
                  style: TextStyle(
                    fontFamily: 'Kanit',
                    fontWeight: FontWeight.normal,
                    fontSize: 30.0,
                    color: Color(0xFF8D8BC5),
                  ),
                ),
              ],
            ),
            const Text(
              "An app for managing notifications tailored to a user-friendly experience.",
              style: TextStyle(
                fontFamily: 'Kanit',
                fontWeight: FontWeight.w300,
                fontSize: 18.0,
              ),
            ),
            const SizedBox(height: 38.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                OutlinedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const SignInScreen(),
                          transitionDuration: const Duration(milliseconds: 700),
                          transitionsBuilder: (_, animation, __, child) {
                            const begin = Offset(1.0, 0.0); // Entering from right
                            const end = Offset(0.0, 0.0); // Exiting to left
                            var tween = Tween(begin: begin, end: end);
                            var offsetAnimation = animation.drive(tween);

                            return SlideTransition(position: offsetAnimation, child: child);
                          },
                        )

                    );
                  },
                  style: ButtonStyle(
                    side: MaterialStateProperty.all(
                      const BorderSide(
                        width: 1.0,
                        color: Color(0xFF8D8BC5),
                      ),
                    ),
                  ),
                  child: const Text(
                    "Sign In",
                    style: TextStyle(fontSize: 15.0, color: Color(0xFF8D8BC5)),
                  ),
                ),
                const SizedBox(width: 20.0),
                ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                        context,
                        PageRouteBuilder(
                          pageBuilder: (_, __, ___) => const SignUpScreen(),
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
                  },
                  style: ElevatedButton.styleFrom(backgroundColor: const Color(0xFF8D8BC5)),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(fontSize: 15.0, color: Color(0xFFF4F0F8)),
                  ),
                ),
              ],
            ),
            //const Spacer(),
            const OrSection(),
            Text(
              "Connect using different method",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontFamily: 'Kanit',
                fontSize: 12.0,
                color: Theme.of(context).textTheme.bodyLarge?.color?.withAlpha(102),
              ),
            ),
            const SizedBox(height: 24.0),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                GoogleConnectOption(
                  onSignInByGoogleClick: () {

                  },
                ),
                const SizedBox(width: 16.0),
                const FacebookConnectOption(
                  // authViewModel: authViewModel,
                  // onAuthError: (error) {
                  //   // handle Facebook authentication error
                  //   print(error);
                  // },
                ),
              ],
            ),
            const SizedBox(height: 16.0),
          ],
        ),
      ),
    );
  }
}

class ImageCard extends StatelessWidget {
  const ImageCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(28.0),
      ),
      elevation: 11.0,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(28.0),
        child: const Image(
          image: AssetImage('assets/images/connect_image.png'), // replace with your image asset
          height: 320.0,
          fit: BoxFit.cover,
        ),
      ),
    );
  }
}

class OrSection extends StatelessWidget {
  const OrSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        Row(
          children: [
            Expanded(
              child: Divider(
                color: Theme.of(context).textTheme.bodyLarge?.color?.withAlpha(102),
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10.0),
              child: Text(
                'or',
                style: Theme.of(context).textTheme.bodyLarge?.copyWith(
                  fontFamily: 'Kanit',
                  fontSize: 12.0,
                ),
              ),
            ),
            Expanded(
              child: Divider(
                color: Theme.of(context).textTheme.bodyLarge?.color?.withAlpha(102),
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class GoogleConnectOption extends StatelessWidget {
  final VoidCallback onSignInByGoogleClick;

  const GoogleConnectOption({super.key, required this.onSignInByGoogleClick});

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 1.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: onSignInByGoogleClick,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ic_google.png', // replace with your Google icon asset
                height: 20.0,
              ),
              const SizedBox(width: 8.0),
              Text(
                'Google',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FacebookConnectOption extends StatelessWidget {
  const FacebookConnectOption({super.key});

  // final AuthViewModel authViewModel;
  // final Function(Exception) onAuthError;
  //
  // FacebookConnectOption({
  //   required this.authViewModel,
  //   required this.onAuthError,
  // });

  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16.0),
      ),
      elevation: 1.0,
      child: InkWell(
        borderRadius: BorderRadius.circular(16.0),
        onTap: () {
          // Launch Facebook login
          // Handle callbacks and call authViewModel.facebookSignIn(credential) on success
          // Call onAuthError on error
        },
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/ic_facebook.png', // replace with your Facebook icon asset
                height: 20.0,
              ),
              const SizedBox(width: 8.0),
              Text(
                'Facebook',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
