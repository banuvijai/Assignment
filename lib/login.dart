import 'package:assignment/Core/user_repository.dart';
import 'package:assignment/progress_hud.dart';
import 'package:assignment/user_details.dart';
import 'package:assignment/utils/app_colors.dart';
import 'package:assignment/utils/app_constants.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'Core/user_model.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernamectrl = TextEditingController();
  TextEditingController passwordctrl = TextEditingController();
  bool isApiCallProcess = false;

  @override
  Widget build(BuildContext context) {
    return ProgressHUD(
        valueColor:Colors.orange,
        opacity: 0.3,
        inAsyncCall: isApiCallProcess,
     child: Scaffold(
      body: Stack(
        children: [
          const Image(image:AssetImage("assets/loginbg.png"),),
          Positioned(
            top:MediaQuery.of(context).size.height/6,
            left:MediaQuery.of(context).size.width/4,
            right:MediaQuery.of(context).size.width/4,
            child: Icon(CupertinoIcons.person_alt_circle,size:100,color: primaryColor,
            ),
          ),
          SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children:[
                SizedBox(height:MediaQuery.of(context).size.height/2.2),
               const Padding(
                 padding:EdgeInsets.all(25.0),
                 child: AppConstants.loginHeading,
               ),
                Container(
                  margin: const EdgeInsets.fromLTRB(25,0.0,25.0,5.0),
                  child: TextFormField(
                    controller: usernamectrl,
                    keyboardType: TextInputType.text,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: primaryColor,
                      hintText: "Username",
                      enabledBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color:secondaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color: primaryColor),
                      ),
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.fromLTRB(25.0,5.0,25.0,5.0),
                  child: TextFormField(
                    controller: passwordctrl,
                    keyboardType: TextInputType.text,
                    cursorColor: primaryColor,
                    decoration: InputDecoration(
                      border: InputBorder.none,
                      focusColor: primaryColor,
                      hintText: "Password",
                      enabledBorder: OutlineInputBorder(
                        borderSide:
                        BorderSide(width: 1, color:secondaryColor),
                      ),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(width: 1, color:primaryColor),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(25.0),
                  child: TextButton(
                      style: ButtonStyle(backgroundColor: MaterialStateProperty.all<Color?>(primaryColor)),
                    onPressed:(){
                      setState(() {
                        isApiCallProcess=true;
                      });
                     getUserDetails().then((List<UserDetailResponse>? value){
                       debugPrint('value ---- ${value}');
                       setState(() {
                         isApiCallProcess=false;
                       });
                       Navigator.pushReplacement(
                           context,
                           MaterialPageRoute(
                               builder: (BuildContext context) =>
                                   UserDetails(userDetailResponse: value,)));
                     });

                    },
                    child:const Center(child: Padding(
                      padding: EdgeInsets.all(8.0),
                      child: AppConstants.loginButton,
                    )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    AppConstants.signUp,
                    SizedBox(width: MediaQuery.of(context).size.width/5),
                    AppConstants.forgotPassword,
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
     ),
    );
  }
}
