import 'package:grocery_admin/providers/base_provider.dart';
import 'package:grocery_admin/user.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationProvider extends BaseAuthenticationProvider {
  //final FirebaseAuth firebaseAuth = FirebaseAuth.instance;
  User user = User();

  @override
  void dispose() {}

  @override
  Future<bool> checkIfSignedIn() async {
    if (user.data.userData.status == 1) {
      return true;
    } else {
      return false;
    }
    //final user = firebaseAuth.currentUser;
    // return user != null;
  }

  @override
  Future<User> getCurrentUser() async {
    bool val = false;

    val = await checkIfSignedIn();
    if (val == true) {
      return user;
    }
    return null;
    // return firebaseAuth.currentUser;
  }

  @override
  Future<bool> signOutUser() async {
    if (user.data.userData.status == 1) {
      return false;
    } else {
      return true;
    }
    // try {
    //   Future.wait([
    //     firebaseAuth.signOut(),
    //     // googleSignIn.signOut(),
    //   ]);

    //   return true;
    // } catch (e) {
    //   return false;
    // }
  }

//   Future<User> signInWithEmail(String email, String password) async {
//     try {
//       UserCredential authResult = await firebaseAuth.signInWithEmailAndPassword(
//           email: email, password: password);

//       if (authResult.user != null) {
//         return authResult.user;
//       } else {
//         return null;
//       }
//     } catch (e) {
//       print(e);
//       return null;
//     }
//   }
// }
  Future<User> signInWithEmail(String mobileno, String password) async {
    String url =
        "https://regalmojo.in/groceryServer/api/additionalHelper/signIn";
    try {
      await http.post(url, body: {
        "loginUserName": mobileno,
        "loginPassword": password,
        "regContact": "9780824448",
        "loginType": "Admin",
      }).then((response) {
        print(response.statusCode);
        //  print(response.body);
        // setState(() {
        //   inProgress = false;
        // });
        var data = jsonDecode(response.body);
        print(data);

        user = User.fromJson(data);

        // if (response.statusCode == 200)
        //   Navigator.push(
        //       context, MaterialPageRoute(builder: (context) => HomeScreen()));
        // else {
        //   showSnack("${data["message"]}", context);
        // }
      });
    } catch (e) {
      print("error is :${e.toString()}");
    }
    return user;
  }
}
