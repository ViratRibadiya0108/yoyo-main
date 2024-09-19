
import 'package:firebaseconnection/core/constants/app_colors.dart';
import 'package:firebaseconnection/core/constants/app_strings.dart';
import 'package:firebaseconnection/core/constants/provaider/auth_provaider.dart';
import 'package:firebaseconnection/presenatation/onboarding/widgets/login_screen/login_screen.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CreateAccountScreen extends StatefulWidget {
  const CreateAccountScreen({super.key});

  @override
  State<CreateAccountScreen> createState() => _CreateAccountScreenState();
}

class _CreateAccountScreenState extends State<CreateAccountScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  // signup() async {
  //   await FirebaseAuth.instance.createUserWithEmailAndPassword(
  //       email: email.text, password: password.text);

  // }

  @override
  Widget build(BuildContext context) {
    // ignore: no_leading_underscores_for_local_identifiers
    final _screenHeight = MediaQuery.of(context).size.height;
    // ignore: no_leading_underscores_for_local_identifiers
    final _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Consumer<Auth>(
        builder: (context, authProvider, child) => SafeArea(
            child:authProvider.isLoading == true? const Center(child: CircularProgressIndicator()) : Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                CreatAccountString.account,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Text(
                CreatAccountString.start,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
              ),
              SizedBox(
                height: _screenHeight * 0.03,
              ),
              const Text(
                CreatAccountString.user,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black12),
                child: TextFormField(
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      icon: Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8, left: 8),
                        child: Icon(
                          Icons.perm_identity,
                          color: Colors.black54,
                        ),
                      ),
                      hintText: CreatAccountString.user),
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.02,
              ),
              const Text(
                CreatAccountString.email,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black12),
                child: TextFormField(
                  controller: email,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      icon: Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8, left: 8),
                        child: Icon(
                          Icons.email,
                          color: Colors.black54,
                        ),
                      ),
                      hintText: CreatAccountString.email),
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.03,
              ),
              const Text(
                CreatAccountString.password,
                style: TextStyle(
                  fontSize: 18,
                ),
              ),
              Container(
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    color: Colors.black12),
                child: TextFormField(
                  controller: password,
                  decoration: const InputDecoration(
                      border: InputBorder.none,
                      icon: Padding(
                        padding: EdgeInsets.only(top: 8, bottom: 8, left: 8),
                        child: Icon(
                          Icons.lock,
                          color: Colors.black54,
                        ),
                      ),
                      hintText: CreatAccountString.password),
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.06,
              ),
              Center(
                //Create_Account_Button
                child: InkWell(
                  onTap: () async {
                    await authProvider.createAccountScreen(
                        email: email.text, password: password.text);
                  },
                  child: Container(
                    height: _screenHeight * 0.07,
                    width: _screenWidth * 0.85,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 2, 44, 255),
                        borderRadius: BorderRadius.all(Radius.circular(40.0))),
                    child: const Center(
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
              Center(
                child: Column(
                  children: [
                    SizedBox(
                      height: _screenHeight * 0.03,
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => const LoginScreen(),
                              ));
                        },
                        child: const Text(CreatAccountString.othermethod)),
                    SizedBox(
                      height: _screenHeight * 0.03,
                    ),
                    Container(
                      height: _screenHeight * 0.07,
                      width: _screenWidth * 0.85,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.black26),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40.0))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: _screenHeight * 0.1,
                                width: _screenWidth * 0.1,
                                child: const Image(
                                    image:
                                        AssetImage('assets/google_logo.png'))),
                            SizedBox(
                              width: _screenWidth * 0.02,
                            ),
                            const Text(
                              'Sign Up with Google',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                    SizedBox(
                      height: _screenHeight * 0.02,
                    ),
                    Container(
                      height: _screenHeight * 0.07,
                      width: _screenWidth * 0.85,
                      decoration: BoxDecoration(
                          border: Border.all(color: AppColors.black26),
                          borderRadius:
                              const BorderRadius.all(Radius.circular(40.0))),
                      child: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            SizedBox(
                                height: _screenHeight * 0.1,
                                width: _screenWidth * 0.1,
                                child: const Image(
                                    image: AssetImage(
                                        'assets/facebook_logo.png'))),
                            SizedBox(
                              width: _screenWidth * 0.02,
                            ),
                            const Text(
                              'Sign Up with Facebook',
                              style: TextStyle(
                                  fontSize: 18, fontWeight: FontWeight.bold),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ],
          ),
        )),
      ),
    );
  }
}
