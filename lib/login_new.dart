import 'package:flutter/material.dart';

class LoginScreenNew extends StatefulWidget{
  const LoginScreenNew({super.key});

  @override
  State<LoginScreenNew> createState() => _LoginScreenNewState(); //_ -> Private
}

class _LoginScreenNewState extends State<LoginScreenNew>{
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void showMessage(String title, String message){
    showDialog(context: context, 
    builder: (context){
      return AlertDialog(
        title: Text(title),
        content: Text(message),
        actions: [
          ElevatedButton(onPressed: (){Navigator.pop(context);}, child: const Text("Ok"))
        ],
      );
    }
    );
  }

  void login(){
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    if(username.isEmpty){
      showMessage("Error", "Please enter username");
      return;
    } 
    if(username.length<6){
      showMessage("Error", "Please enter a valid username");
      return;
    }
    if(password.isEmpty){
      showMessage("Error", "Please enter password");
      return;
    }

    if(username == "inderpreet" && password == "1234567"){
      showMessage("Success", "You are successfully login into your account");
    }


  }


  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Form"),
        centerTitle: true,
      ),
      body: Center(
        child: Container(
          width: 350,
          padding:const EdgeInsets.all(20),
          decoration: BoxDecoration(
            color: Colors.grey.shade100,
            borderRadius: BorderRadius.circular(15),
            border: Border.all(color: Colors.grey)
          ),
          child:Column(
            children: [
              const Text("Login", style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),),
              const SizedBox(height: 20,),
              TextField(
                controller: usernameController,
                decoration: const InputDecoration(
                  label: const Text("Username"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person)
                ),
              ),
              const SizedBox(height: 10,),
              TextField(
                controller: passwordController,
                obscureText: true,
                decoration: const InputDecoration(
                  label: const Text("Password"),
                  border: OutlineInputBorder(),
                  prefixIcon: Icon(Icons.person)
                ),                
              ),
              const SizedBox(height: 20,),
              ElevatedButton(onPressed: login, child: const Text("Login"))
            ],
          )
        ),
      ),
    );
  }
}