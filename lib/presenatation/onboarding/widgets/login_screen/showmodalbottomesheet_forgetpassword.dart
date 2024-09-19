import 'package:firebaseconnection/core/constants/app_colors.dart';
import 'package:firebaseconnection/core/constants/app_strings.dart';
import 'package:firebaseconnection/core/constants/provaider/auth_provaider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ForgetPassword extends StatefulWidget {
  const ForgetPassword({super.key});

  @override
  State<ForgetPassword> createState() => _ForgetPasswordState();
}

class _ForgetPasswordState extends State<ForgetPassword> {
  TextEditingController email = TextEditingController();

//  forgetpaasword()async{
//  await FirebaseAuth.instance.sendPasswordResetEmail(email: email.text);
//  }
  @override
  Widget build(BuildContext context) {
    final authProvider = Provider.of<Auth>(context, listen: false);
    // ignore: no_leading_underscores_for_local_identifiers
    final _screenHeight = MediaQuery.of(context).size.height;
    // ignore: no_leading_underscores_for_local_identifiers
    final _screenWidth = MediaQuery.of(context).size.width;
    return Container(
      height: _screenHeight * 0.4,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(18), topRight: Radius.circular(18)),
      ),
      child: Center(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: _screenHeight * 0.01,
                ),
                const Text(
                  LoginScree.forgotp,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
                SizedBox(
                  height: _screenHeight * 0.01,
                ),
                const Text(
                  LoginScree.enteremail,
                  style: TextStyle(
                    fontSize: 15,
                  ),
                ),
                SizedBox(
                  height: _screenHeight * 0.02,
                ),
                const Text(
                  LoginScree.email,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                TextFormField(
                  controller: email,
                  decoration: InputDecoration(
                      prefixIcon: Icon(
                        Icons.email,
                        color: AppColors.blue,
                      ),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(15),
                        borderSide:
                            BorderSide(color: AppColors.black54, width: 2),
                      ),
                      suffixIcon: const Icon(Icons.task_alt_rounded,
                          color: Colors.green),
                      hintText: LoginScree.email),
                ),
                SizedBox(
                  height: _screenHeight * 0.03,
                ),
                //New Password Bottom screen
                InkWell(
                  onTap: () async {
                    await authProvider.forgetPassword(
                        email: email.text, context: context);
                  },
                  // showModalBottomSheet<void>(
                  //   isDismissible: true,
                  //   showDragHandle: true,
                  //   context: context,
                  //   builder: (BuildContext context) {
                  //     return Container(
                  //       height: _screenHeight * 0.6,
                  //       decoration: const BoxDecoration(
                  //         borderRadius: BorderRadius.only(
                  //             topLeft: Radius.circular(18),
                  //             topRight: Radius.circular(18)),
                  //       ),
                  //       child: Center(
                  //         child: SizedBox(
                  //           width: double.infinity,
                  //           child: Padding(
                  //             padding: const EdgeInsets.all(8.0),
                  //             child: Column(
                  //               crossAxisAlignment: CrossAxisAlignment.start,
                  //               children: [
                  //                 // SizedBox(
                  //                 //   height: _screenHeight * 0.02,
                  //                 // ),
                  //                 const Text(
                  //                   LoginScree.newpassword,
                  //                   style: TextStyle(
                  //                       fontSize: 24,
                  //                       fontWeight: FontWeight.bold),
                  //                 ),
                  //                 SizedBox(
                  //                   height: _screenHeight * 0.01,
                  //                 ),
                  //                 const Text(
                  //                   LoginScree.newpassword,
                  //                   style: TextStyle(
                  //                     fontSize: 15,
                  //                   ),
                  //                 ),
                  //                 SizedBox(
                  //                   height: _screenHeight * 0.02,
                  //                 ),
                  //                 const Text(
                  //                   LoginScree.newpassword,
                  //                   style: TextStyle(
                  //                       fontSize: 18,
                  //                       fontWeight: FontWeight.bold),
                  //                 ),
                  //                 TextFormField(
                  //                   decoration: InputDecoration(
                  //                       prefixIcon: Icon(
                  //                         Icons.email,
                  //                         color: AppColors.blue,
                  //                       ),
                  //                       border: OutlineInputBorder(
                  //                         borderRadius:
                  //                             BorderRadius.circular(15),
                  //                         borderSide: BorderSide(
                  //                             color: AppColors.black54,
                  //                             width: 2),
                  //                       ),
                  //                       suffixIcon: const Icon(
                  //                           Icons.task_alt_rounded,
                  //                           color: Colors.green),
                  //                       hintText: LoginScree.newpassword),
                  //                 ),
                  //                 SizedBox(
                  //                   height: _screenHeight * 0.02,
                  //                 ),
                  //                 const Text(
                  //                   LoginScree.newpassword,
                  //                   style: TextStyle(
                  //                       fontSize: 18,
                  //                       fontWeight: FontWeight.bold),
                  //                 ),
                  //                 TextFormField(
                  //                   decoration: InputDecoration(
                  //                       prefixIcon: Icon(
                  //                         Icons.email,
                  //                         color: AppColors.blue,
                  //                       ),
                  //                       border: OutlineInputBorder(
                  //                         borderRadius:
                  //                             BorderRadius.circular(15),
                  //                         borderSide: BorderSide(
                  //                             color: AppColors.black54,
                  //                             width: 2),
                  //                       ),
                  //                       suffixIcon: const Icon(
                  //                           Icons.task_alt_rounded,
                  //                           color: Colors.green),
                  //                       hintText: LoginScree.newpassword),
                  //                 ),
                  //                 SizedBox(
                  //                   height: _screenHeight * 0.03,
                  //                 ),
                  //                 InkWell(
                  //                   onTap: () {},
                  //                   child: Container(
                  //                     height: _screenHeight * 0.07,
                  //                     width: _screenWidth * 0.95,
                  //                     decoration: BoxDecoration(
                  //                         color: AppColors.blue,
                  //                         borderRadius:
                  //                             const BorderRadius.all(
                  //                                 Radius.circular(40.0))),
                  //                     child: const Center(
                  //                       child: Text(
                  //                         LoginScree.sendcode,
                  //                         style: TextStyle(
                  //                             color: Colors.white,
                  //                             fontSize: 18,
                  //                             fontWeight: FontWeight.bold),
                  //                       ),
                  //                     ),
                  //                   ),
                  //                 ),
                  //               ],
                  //             ),
                  //           ),
                  //         ),
                  //       ),
                  //     );
                  //   },
                  // );

                  child: Container(
                    height: _screenHeight * 0.07,
                    width: _screenWidth * 0.95,
                    decoration: BoxDecoration(
                        color: AppColors.blue,
                        borderRadius:
                            const BorderRadius.all(Radius.circular(40.0))),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
