import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';

Future initFirebase() async {
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: FirebaseOptions(
            apiKey: "AIzaSyBejrZtiGwSCET6iuXlN2b0J2ZnfW-GGRU",
            authDomain: "smstrackingapp-39dd2.firebaseapp.com",
            projectId: "smstrackingapp-39dd2",
            storageBucket: "smstrackingapp-39dd2.appspot.com",
            messagingSenderId: "831486713830",
            appId: "1:831486713830:web:98287b7dfe01026d8c8027",
            measurementId: "G-LF46ZVBT70"));
  } else {
    await Firebase.initializeApp();
  }
}
