import 'package:flutter/material.dart';
import 'signup_page.dart';

class LoginPage extends StatelessWidget {

  final _formKey = GlobalKey<FormState>();

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("login")),

      body: Padding(
        padding: EdgeInsets.all(20),

        child: Form(
            key: _formKey,

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              "Welcome Back",
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
                  return "Enter valid email";
    }
                return null;
    },


            ),

            SizedBox(height: 15),

            TextFormField(controller: passwordController,
            obscureText: true,
            decoration: InputDecoration(
              labelText: "Password",
              border: OutlineInputBorder(),
            ),
              validator: (value) {
              if(value==null || value.isEmpty) {
                return "Enter Password";
    }
              if(value.length < 6) {
                return "Password must be atleast 6 characters";
    }
              return null;
    },
            ),

            SizedBox(height: 20),

            ElevatedButton(
              onPressed: () {

                if(_formKey.currentState!.validate()) {
    print(emailController.text);
    print(passwordController.text);
    }
              },

              child: Text("Login"),
            ),

            SizedBox(height: 10),

            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => SignupPage()),
                );
              },
              child: Text("Don't Have an Account? Sign Up"),
            ),
          ],
        ),
      ),
    ),
    );
  }
}