import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class LoginScreen extends StatelessWidget{
  LoginScreen({super.key});

  final TextEditingController usernameController = TextEditingController();

    final TextEditingController emailController = TextEditingController();

      final TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(title: const Text("Login"),),
      body: Center(
         child: Container(
          width: 350,
          padding: const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color:Colors.grey.shade100,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey)
          ),
          child:   Column(
            children: [
            const  Text("Login", style: TextStyle(fontSize: 30,fontWeight: FontWeight.bold),),
             const SizedBox(height: 30,
              ),
             TextField(
              controller: usernameController,
                decoration:const InputDecoration(
                  labelText: "Username",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person)
                ),
              ),
              const SizedBox(height: 15,),
              TextField(
                controller: emailController,
                decoration:const InputDecoration(
                  labelText: "Email",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.email)
                ),
              ),
               const SizedBox(height: 15,),              
               TextField(
                controller: passwordController,
                obscureText: true,
                decoration:const  InputDecoration(
                  labelText: "Password",
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.lock)
                ),
              ), 
              const SizedBox(height: 25,),
               SizedBox(
                child: OutlinedButton(
                  child: const Text("Login"),
                  onPressed: () {
                    print("The button is clicked");
                  },
                  ),
              )

                           
            ],
          ),
         ),
      ),
    );
  }
}