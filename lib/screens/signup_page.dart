import 'package:chattingapp/screens/home_page.dart';
import 'package:chattingapp/screens/login_page.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class SignupPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmpasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Sign up")),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Form(
          key: _formKey,

          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children : [

              Text(
                "Create Account",
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
              ),

              SizedBox(height: 20),

              TextFormField(
                controller: emailController,
                decoration: InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Enter email";
                  }
                  if(!value.contains("@")) {
                    return "Enter valid email";
                  }
                  return null;
                },
              ),

              SizedBox(height: 15),
              TextFormField(
                controller: passwordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if(value==null || value.isEmpty){
                    return "Enter Password";
                  }
                  if(value.length<6){
                    return "Password must be at least 6 characters";
                  }
                  return null;
                },
              ),

              SizedBox(height: 15),
              TextFormField(
                controller: confirmpasswordController,
                obscureText: true,
                decoration: InputDecoration(
                  labelText: "Confirm Password",
                  border: OutlineInputBorder(),
                ),
                validator: (value) {
                  if(value == null || value.isEmpty) {
                    return "Confirm your password is not empty";
                  }
                  if(value != passwordController.text) {
                    return "Passwords do not match";
                  }
                  return null;
                },


              ),

              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () async {
                  if (_formKey.currentState!.validate()) {

                    try{

                      await FirebaseAuth.instance.createUserWithEmailAndPassword(email: emailController.text.trim(), password: passwordController.text.trim(),);

                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Sigup Successful")),);

                      FocusScope.of(context).unfocus();

                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(builder: (_) => HomePage()),
                      );
                    } on FirebaseAuthException catch (e) {
                      ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text(e.message ?? "Signup Failed")),
                      );
                    }
                  }
                },
                child: Text("Sign Up"),
              ),

              SizedBox(height: 10),

              TextButton(onPressed: () {
                Navigator.push(
                  context, MaterialPageRoute(builder: (_) => LoginPage()),
                );
              },
                child: Text("Already have an account? Login"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
