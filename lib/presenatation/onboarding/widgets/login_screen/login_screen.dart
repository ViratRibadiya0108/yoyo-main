import 'package:firebaseconnection/core/constants/app_colors.dart';
import 'package:firebaseconnection/core/constants/app_strings.dart';
import 'package:firebaseconnection/core/constants/provaider/auth_provaider.dart';
//  import 'package:firebaseconnection/presenatation/onboarding/widgets/home_screen/home_screen.dart';
import 'package:firebaseconnection/presenatation/onboarding/widgets/login_screen/create_account.dart';
import 'package:firebaseconnection/presenatation/onboarding/widgets/login_screen/showmodalbottomesheet_forgetpassword.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  TextEditingController email = TextEditingController();
  TextEditingController password = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context, listen: false);
    // ignore: no_leading_underscores_for_local_identifiers
    final _screenHeight = MediaQuery.of(context).size.height;
    // ignore: no_leading_underscores_for_local_identifiers
    final _screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      body:authProvider.isLoading == true? const CircularProgressIndicator(): Stack(children: [
        SafeArea(
            child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                LoginScree.account,
                style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
              ),
              const Text(
                LoginScree.ragisted,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w100),
              ),
              SizedBox(
                height: _screenHeight * 0.03,
              ),
              const Text(
                LoginScree.email,
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
                          Icons.perm_identity,
                          color: Colors.black54,
                        ),
                      ),
                      hintText: LoginScree.email),
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.03,
              ),
              const Text(
                LoginScree.password,
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
                      hintText: LoginScree.password),
                ),
              ),
              SizedBox(
                height: _screenHeight * 0.01,
              ),
              //Bottom Sheet For Forget Password
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                      onTap: () {
                        showModalBottomSheet<void>(
                          isDismissible: true,
                          showDragHandle: true,
                          context: context,
                          builder: (BuildContext context) {
                            return const ForgetPassword();
                          },
                        );
                      },
                      child: const Text(LoginScree.forgotp)),
                ],
              ),
              SizedBox(
                height: _screenHeight * 0.06,
              ),
              Center(
                child: InkWell(
                  onTap: () async {
                    await authProvider.loginScree(
                        email: email.text,
                        password: password.text,
                        context: context);
                  },
                  child: Container(
                    height: _screenHeight * 0.07,
                    width: _screenWidth * 0.85,
                    decoration: const BoxDecoration(
                        color: Color.fromARGB(255, 2, 44, 255),
                        borderRadius: BorderRadius.all(Radius.circular(40.0))),
                    child: const Center(
                      child: Text(
                        LoginScree.sendcode,
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
                                builder: (context) =>
                                    const CreateAccountScreen(),
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
              ),
            ],
          ),
        )),
        if (authProvider.isLoading) // Show loader if loading
          Container(
            color: Colors.black.withOpacity(0.5), // Overlay color
            child: const Center(
              child: CircularProgressIndicator(), // Circular loader
            ),
          ),
      ]),
    );
  }
}
