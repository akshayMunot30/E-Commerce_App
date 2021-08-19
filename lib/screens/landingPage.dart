import 'package:e_commerce_app/constants.dart';
import 'package:e_commerce_app/screens/homepage.dart';
import 'package:e_commerce_app/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';

class LandingPage extends StatelessWidget {
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Initialize FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // if snapshot has error
        if (snapshot.hasError) {
          return Scaffold(
            body: Center(
              child: Text("Error: ${snapshot.error}"),
            ),
          );
        }

        // Once complete, show your application (Connection made to firebase, app is running)
        if (snapshot.connectionState == ConnectionState.done) {
          // StreamBuilder can check the login state live
          return StreamBuilder(
            stream: FirebaseAuth.instance.authStateChanges(),
            builder: (context, streamSnapshot) {
              // if stream snapshot has error
              if (streamSnapshot.hasError) {
                return Scaffold(
                  body: Center(
                    child: Text("Error: ${streamSnapshot.error}"),
                  ),
                );
              }

              // Connection state active - Do the user login check inside the
              // if statement
              if (streamSnapshot.connectionState == ConnectionState.active) {
                // Get the user
                Object? _user = streamSnapshot.data;

                //if _user is null, then we are not logged in
                if (_user == null) {
                  // user not logged in
                  return LoginPage();
                } else {
                  //the user is logged in, head to homepage
                  return HomePage();
                }
              }

              // Checking the auth state - Loading
              return Scaffold(
                body: Center(
                  child: Text("Checking Authentication....",
                      style: Constants.regularHeading),
                ),
              );
            },
          );
        }

        // Otherwise, show something whilst waiting for initialization to complete
        return Scaffold(
          body: Center(
            child: Text("Initializing app...", style: Constants.regularHeading),
          ),
        );
      },
    );
  }
}
