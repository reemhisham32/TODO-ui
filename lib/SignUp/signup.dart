
import 'package:flutter/material.dart';

class SignUpScreen extends StatelessWidget {
  static const String routeName="SignUp";
  var formkey =GlobalKey<FormState>();
  var emailController=TextEditingController();
  var passwordConteroller=TextEditingController();
  var nameController=TextEditingController();
  var ageConteroller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return  Container(
      decoration: BoxDecoration(
          image: DecorationImage(image: AssetImage
            ("assets/backgroud.png"),fit: BoxFit.fill)
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: formkey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if(value==null||value==""){
                      return "please enter username";
                    }
                    final bool emailValid =
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[gmail]+\.[com]+")
                        .hasMatch(value);
                    if(!emailValid){
                      return "please enter valid email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      label: Text("UserName"),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue))),
                ),
                TextFormField(
                  controller: emailController,
                  validator: (value) {
                    if(value==null||value==""){
                      return "please enter username";
                    }
                    final bool emailValid =
                    RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[gmail]+\.[com]+")
                        .hasMatch(value);
                    if(!emailValid){
                      return "please enter valid email";
                    }
                    return null;
                  },
                  decoration: InputDecoration(
                      label: Text("UserName"),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue))),
                ),
                SizedBox(
                  height: 15,
                ),
                TextFormField(
                  controller: passwordConteroller,
                  validator: (value) {
                    if(value==null||value.length<6){
                      return"please enter valid password";

                    }
                    return null;

                  },
                  decoration: InputDecoration(
                      label: Text("Password"),
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue)),
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue)),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(12),
                          borderSide: BorderSide(color: Colors.blue))),
                ),
                ElevatedButton(onPressed: () {
                  if(formkey.currentState!.validate()){

                  }
                }, child: Text("Login"))
              ],
            ),
          ),
        ),
        appBar:AppBar(),
      ),
    );
  }
}



