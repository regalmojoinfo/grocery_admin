//import 'package:ecommerce_store_admin/widgets/dialogs/processing_dialog.dart';
//import 'package:firebase_auth/firebase_auth.dart';
import 'package:flushbar/flushbar.dart';
import 'package:flutter/material.dart';
//import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_admin/pages/dashboard_page.dart';
import 'package:grocery_admin/screens/home_screen.dart';
import 'package:grocery_admin/widgets/dialogs/processing_dialog.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
//import 'package:dio/dio.dart';

class SignInScreen extends StatefulWidget {
  @override
  _SignInScreenState createState() => _SignInScreenState();
}

class _SignInScreenState extends State<SignInScreen> {
  String baseUrl = "https://regalmojo.in";
  //final _scaffoldKey = GlobalKey<ScaffoldState>();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  TextEditingController emailController = TextEditingController();
  // String email;
  String mobileno;
  String password;
  bool inProgress = false;

  // @override
  // void initState() {
  //   super.initState();
  //   inProgress = false;

  //   signinBloc = BlocProvider.of<SignInBloc>(context);
  //   initialSetupBloc = BlocProvider.of<InitialSetupBloc>(context);

  //   signinBloc.listen((state) {
  //     print('SIGN IN BLOC :: $state');
  //     if (state is SignInWithEmailEventInProgressState) {
  //       //in progress
  //       if (inProgress) {
  //         showUpdatingDialog();
  //       }
  //     }
  //     if (state is SignInWithEmailEventFailedState) {
  //       //FAILED
  //       if (inProgress) {
  //         Navigator.pop(context);
  //         setState(() {
  //           inProgress = false;
  //           showSnack('Failed to sign in!', context);
  //         });
  //       }
  //     }
  //     if (state is SignInWithEmailEventCompletedState) {
  //       //completed
  //       if (inProgress) {
  //         firebaseUser = state.firebaseUser;
  //         signinBloc.add(CheckIfNewAdminEvent(firebaseUser.uid));
  //         // Navigator.pop(context);
  //         // setState(() {
  //         //   inProgress = false;
  //         //   showSnack('Signed in successfully!', context);
  //         // });
  //         // Navigator.popAndPushNamed(context, '/home');
  //       }
  //     }
  //     // if (state is CheckIfNewAdminInProgressState) {
  //     //   //in progress
  //     //   if (inProgress) {
  //     //     showUpdatingDialog();
  //     //   }
  //     // }
  //     if (state is CheckIfNewAdminFailedState) {
  //       //FAILED
  //       if (inProgress) {
  //         Navigator.pop(context);
  //         setState(() {
  //           inProgress = false;
  //           showSnack('Failed to sign in!', context);
  //         });
  //       }
  //     }
  //     if (state is CheckIfNewAdminCompletedState) {
  //       //completed
  //       if (inProgress) {
  //         // Navigator.pop(context);
  //         // setState(() {
  //         //   inProgress = false;
  //         //   showSnack('Signed in successfully!', context);
  //         // });

  //         //check if initial setup is done or not
  //         initialSetupBloc.add(CheckIfInitialSetupDoneEvent());

  //         // Navigator.popAndPushNamed(context, '/home');
  //       }
  //     }
  //   });

  //   initialSetupBloc.listen((state) {
  //     print('INITIAL SETUP BLOC :: $state');

  //     if (state is CheckIfInitialSetupDoneInProgressState) {
  //       //in progress
  //       if (inProgress) {
  //         // showUpdatingDialog();
  //       }
  //     }
  //     if (state is CheckIfInitialSetupDoneFailedState) {
  //       //FAILED
  //       if (inProgress) {
  //         Navigator.pop(context);
  //         setState(() {
  //           inProgress = false;
  //           showSnack('Failed to sign in!', context);
  //         });
  //       }
  //     }
  //     if (state is CheckIfInitialSetupDoneCompletedState) {
  //       //completed
  //       if (inProgress) {
  //         if (!state.isDone) {
  //           //send to initial setup
  //           Navigator.popAndPushNamed(context, '/initial_setup');
  //         } else {
  //           //send to home
  //           // Navigator.pop(context);
  //           // setState(() {
  //           //   inProgress = false;
  //           //   showSnack('Signed in successfully!', context);
  //           // });
  //           Navigator.popAndPushNamed(context, '/home');
  //         }
  //       }
  //     }
  //   });
  // }

//Getting Api data
  Future authenticateApi(String mobileno, String password) async {
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
        setState(() {
          inProgress = false;
        });
        var data = jsonDecode(response.body);
        print(data);
        if (response.statusCode == 200)
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => HomeScreen()));
        else {
          showSnack("${data["message"]}", context);
        }
      });
    } catch (e) {
      print("error is :${e.toString()}");
    }
  }

  showUpdatingDialog() {
    return showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return ProcessingDialog(
          message: 'Signing in..\nPlease wait!',
        );
      },
    );
  }

  void showSnack(String text, BuildContext context) {
    Flushbar(
      margin: const EdgeInsets.all(8.0),
      borderRadius: 8.0,
      backgroundColor: Colors.red.shade500,
      animationDuration: Duration(milliseconds: 300),
      isDismissible: true,
      boxShadows: [
        BoxShadow(
          color: Colors.black12,
          spreadRadius: 1.0,
          blurRadius: 5.0,
          offset: Offset(0.0, 2.0),
        )
      ],
      shouldIconPulse: false,
      duration: Duration(milliseconds: 2000),
      icon: Icon(
        Icons.error,
        color: Colors.white,
      ),
      messageText: Text(
        '$text',
        style: GoogleFonts.poppins(
          fontSize: 14.0,
          fontWeight: FontWeight.w500,
          letterSpacing: 0.3,
          color: Colors.white,
        ),
      ),
    )..show(context);
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      // key: _scaffoldKey,
      body: inProgress
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Container(
                    height: 230.0,
                    width: size.width,
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context).primaryColorDark,
                          Theme.of(context).primaryColor,
                        ],
                      ),
                      borderRadius: BorderRadius.only(
                        bottomRight: Radius.circular(30.0),
                        bottomLeft: Radius.circular(30.0),
                      ),
                    ),
                    child: SvgPicture.asset(
                      'assets/banners/verification.svg',
                      fit: BoxFit.contain,
                    ),
                  ),
                  Container(
                    height: size.height - 230.0,
                    width: size.width,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 0.0, vertical: 0.0),
                    decoration: BoxDecoration(
                      color: Colors.white,
                    ),
                    child: ListView(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20.0, vertical: 5.0),
                      children: <Widget>[
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Welcome',
                          style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.85),
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(
                          height: 8.0,
                        ),
                        Text(
                          'Sign in and get admin level access to the app',
                          style: GoogleFonts.poppins(
                            color: Colors.black.withOpacity(0.7),
                            fontSize: 14.5,
                            fontWeight: FontWeight.w400,
                            letterSpacing: 0.5,
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        Form(
                          key: _formKey,
                          child: Column(
                            children: <Widget>[
                              TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                validator: (String val) {
                                  if (val.trim().isEmpty) {
                                    return 'Mobile number is required';
                                  }
                                  if (val.isEmpty ||
                                      val.length < 10 ||
                                      val.length > 10) {
                                    return 'Please enter a valid Mobile Number';
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  mobileno = val.trim();
                                },
                                enableInteractiveSelection: true,
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                ),
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  helperStyle: GoogleFonts.poppins(
                                    color: Colors.black.withOpacity(0.65),
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                  errorStyle: GoogleFonts.poppins(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                  hintStyle: GoogleFonts.poppins(
                                    color: Colors.black54,
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.phone,
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                    minWidth: 50.0,
                                  ),
                                  labelText: 'Mobile Number',
                                  labelStyle: GoogleFonts.poppins(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 15.0,
                              ),
                              TextFormField(
                                textAlignVertical: TextAlignVertical.center,
                                validator: (String val) {
                                  if (val.trim().isEmpty) {
                                    return 'Password is required';
                                  }
                                  return null;
                                },
                                onSaved: (val) {
                                  password = val.trim();
                                },
                                enableInteractiveSelection: true,
                                style: GoogleFonts.poppins(
                                  color: Colors.black,
                                  fontSize: 14.5,
                                  fontWeight: FontWeight.w500,
                                  letterSpacing: 0.5,
                                ),
                                obscureText: true,
                                textInputAction: TextInputAction.done,
                                keyboardType: TextInputType.emailAddress,
                                decoration: InputDecoration(
                                  contentPadding: EdgeInsets.all(0),
                                  helperStyle: GoogleFonts.poppins(
                                    color: Colors.black.withOpacity(0.65),
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                  errorStyle: GoogleFonts.poppins(
                                    fontSize: 13.0,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                  hintStyle: GoogleFonts.poppins(
                                    color: Colors.black54,
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                  prefixIcon: Icon(
                                    Icons.lock,
                                  ),
                                  prefixIconConstraints: BoxConstraints(
                                    minWidth: 50.0,
                                  ),
                                  labelText: 'Password',
                                  labelStyle: GoogleFonts.poppins(
                                    fontSize: 14.5,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 0.5,
                                  ),
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 20.0,
                        ),
                        buildSignInButton(size, context),
                      ],
                    ),
                  ),
                ],
              ),
            ),
    );
  }

  Widget buildSignInButton(Size size, BuildContext context) {
    return Center(
      child: Container(
        width: size.width,
        height: 48.0,
        child: FlatButton(
          onPressed: () {
            if (_formKey.currentState.validate()) {
              _formKey.currentState.save();
              print('mobileno: $mobileno');
              print('password:$password');
              setState(() {
                inProgress = true;
              });
              authenticateApi(mobileno, password);
              // signinBloc.add(SignInWithEmailEvent(email, password));

              // Navigator.popAndPushNamed(context, '/home');
            }
          },
          color: Theme.of(context).primaryColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
          child: Text(
            'Sign In',
            style: GoogleFonts.poppins(
              color: Colors.white,
              fontSize: 15.0,
              fontWeight: FontWeight.w600,
              letterSpacing: 0.5,
            ),
          ),
        ),
      ),
    );
  }
}
