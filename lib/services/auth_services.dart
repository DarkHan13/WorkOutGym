import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {

  DatabaseReference? dbRef;

  // Google Sign in
  signInWithGoogle() async {
    dbRef = FirebaseDatabase.instance.ref().child('users');

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
    await FirebaseAuth.instance.signInWithCredential(credential);

    // Access the user's email address
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      final email = user.email!;
      print(email); // Output the email address
      addUserDetails("", "", email, user.uid);
    } else print("NULL");

    return;
  }

  Future addUserDetails(
      String firstname, String lastname,
      String email, String uid
      ) async {
    DatabaseReference newRef = dbRef!.child(uid);
    Map<String, String> dataToSend= {
      'email': email,
      'firstname': firstname,
      'lastname': lastname,
      'imageURL': ''
    };
    await newRef!.set(dataToSend);
  }

}