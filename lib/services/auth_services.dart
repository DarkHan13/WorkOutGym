import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  // Google Sign in
  signInWithGoogle() async {
    // begin interactive sign in process
    print("STEP 1");
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();

    // obtain auth details from request
    print("STEP 2");
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;

    // create a new credential for user
    print("STEP 3");
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );

    // finally, let's sign in
    print("STEP 4");
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

}