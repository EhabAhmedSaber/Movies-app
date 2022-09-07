import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../layouts/home_layout.dart';
import '../shared/components/constants.dart';
class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  State<LoginForm> createState() => _LoginFormState();
}

class _LoginFormState extends State<LoginForm> {
  bool _isObsecure = true;
  bool pass = true;
  var emailController = TextEditingController();
  var passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: KDefaultPadding,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 120.0,),
                  Text(
                    'Welcome In Movies App',
                    style: splashTitle,
                  ),
                  SizedBox(height: 25.0,),

            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: TextFormField(
                keyboardType: TextInputType.emailAddress,
                controller: emailController,
                decoration: InputDecoration(
                    labelText: 'email',
                    labelStyle: TextStyle(
                      color: KTextFieldColor,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: KprimaryColor),
                    ),
                 ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 5),
              child: TextFormField(
                obscureText: pass? _isObsecure: false,
                controller: passwordController,
                decoration: InputDecoration(
                    labelText: 'password',
                    labelStyle: TextStyle(
                      color: KTextFieldColor,
                    ),
                    focusedBorder: UnderlineInputBorder(
                        borderSide: BorderSide(color: KprimaryColor)
                    ),
                    suffixIcon:pass ? IconButton(
                      onPressed:(){
                        setState(() {
                          _isObsecure=!_isObsecure;
                        });
                      } ,
                      icon: Icon(
                        _isObsecure ? Icons.visibility_off : Icons.visibility
                      ),
                    ):null

              ),
            ),
            ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20.0,),
                    child: Text(
                      'Forgot password?',
                      style: TextStyle(
                        color: KZambeziColor,
                        fontSize: 14,
                        decoration: TextDecoration.underline,
                        decorationThickness: 1,
                      ),
                    ),
                  ),
                  SizedBox(height: 20,),
                  Container(
                    alignment: Alignment.center,
                    height: MediaQuery.of(context).size.height * 0.08,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: KprimaryColor
                    ),
                    child: TextButton(
                      onPressed: () async{
                        final SharedPreferences sharedPreferenes= await SharedPreferences.getInstance();
                        sharedPreferenes.setString('email', emailController.text);
                        Navigator.push(context,
                            MaterialPageRoute(builder: (context) => HomeLayout(),),
                        );
                      },
                      child: Text(
                        'Login',
                        style:textButton.copyWith(color: KwhiteColor),
                      ),
                    ),
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
