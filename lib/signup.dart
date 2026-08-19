import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget{
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen>{
  final _formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController(); 
  String? selectedState;
  String? selectedCity;
  
  final List<String> states = [
    "Uttar Pradesh","Delhi","Maharashtra","Rajasthan"
  ];

  final Map<String,List<String>> cities = {
    "Uttar Pradesh" : ["Agra","Lucknow","Meerut","Noida","Kanpur","Varanase"],
    "Delhi" : ["New Delhi","South Delhi","East Delhi","North Delhi","West Delhi"],
    "Maharashtra":["Mumbai","Pune","Nagpur","Nashik","Thane"],
    "Rajasthan":["Jaipur","Jodhpur","Udaipur"],
  };
// List -> [] Square brackets; Map -> { } Curly Brackets
  @override
  Widget build(BuildContext context){
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4FA),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(25),
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 500
              ),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withAlpha(200),
                    blurRadius: 20,
                    offset: const Offset(0, 8)
                    ),
                ]
              ),
              child: Form(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    //Logo/Icon
                    Center(
                        child: Container(
                          width: 65,
                          height: 65,
                          decoration: BoxDecoration(
                            color: const Color(0xFF6A1B9A),
                            borderRadius: BorderRadius.circular(18),
                          ),
                          child: const Icon(
                            Icons.person_add_alt_1,
                            color: Colors.white,
                            size: 32,
                          ),
                        ),
                    ),
                    const SizedBox(height: 20,),
                    const Center(
                      child: Text(
                        "Create Account",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D123B)
                        ),
                      ),
                    ),
                    const SizedBox(height: 8,),
                    const Center(
                      child: Text(
                        "Create your account to get started",
                        style: TextStyle(
                          fontSize: 14, 
                          color: Color(0xFF2D1438)
                          ),
                      ),
                    ),
                    const SizedBox(height: 40,),
                    //Form
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        label: Text("Full Name"), 
                         ),
                         validator: (value){
                          if(value == null || value.trim().isEmpty){
                            return "Please enter your name";
                          }
                          return null;
                         },
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        label: Text("Email"), 
                         ),
                      validator: (value){
                        if(value == null || value.trim().isEmpty){
                          return "Please enter your email";
                        }
                        final  emailRegex = RegExp(
                          r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$',
                        );
                        if(!emailRegex.hasMatch(value.trim())){
                          return "Please enter a valid email value";
                        }
                        return null;
                      },
                      //Email
                    ),
                    const SizedBox(height: 20,),
                    TextFormField(
                      textInputAction: TextInputAction.next,
                      decoration: const InputDecoration(
                        label: Text("Username"), 
                         ),
                      validator: (value){
                        if(value == null || value.trim().isEmpty){
                          return "Please enter your username";
                        }
                       if(value.trim().length<4){
                          return "Username must be atleast of 4 characters";
                       }
                       return null;
                      },

                    ),
                    const SizedBox(height: 20,),

                    DropdownButtonFormField<String>(
                      items: states.map((state){
                        return DropdownMenuItem<String>(
                          value: state, 
                          child: Text(state)
                        ,);
                      }).toList(),
                      onChanged: (value){
                        
                      },
                      decoration: InputDecoration(
                        label: Text("State")
                      ),
                    ),
                    const SizedBox(height: 20,),

                    DropdownButtonFormField<String>(
                      items: , 
                      onChanged: onChanged
                      );

                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}