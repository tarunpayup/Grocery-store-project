import 'package:flutter/material.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({super.key});

  @override
  State<SignupScreen> createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  final _formKey = GlobalKey<FormState>();

  final TextEditingController nameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();

  String? selectedState;
  String? selectedCity;

  final List<String> states = [
    'Uttar Pradesh',
    'Delhi',
    'Maharashtra',
    'Rajasthan',
    'Gujarat',
    'Karnataka',
    'Telangana',
    'Madhya Pradesh',
  ];

  final Map<String, List<String>> cities = {
    'Uttar Pradesh': [
      'Agra',
      'Lucknow',
      'Meerut',
      'Noida',
      'Ghaziabad',
      'Kanpur',
      'Varanasi',
      'Prayagraj',
    ],
    'Delhi': [
      'New Delhi',
      'Delhi',
    ],
    'Maharashtra': [
      'Mumbai',
      'Pune',
      'Nagpur',
      'Nashik',
      'Thane',
    ],
    'Rajasthan': [
      'Jaipur',
      'Jodhpur',
      'Udaipur',
      'Kota',
      'Ajmer',
    ],
    'Gujarat': [
      'Ahmedabad',
      'Surat',
      'Vadodara',
      'Rajkot',
      'Gandhinagar',
    ],
    'Karnataka': [
      'Bengaluru',
      'Mysuru',
      'Mangaluru',
      'Hubballi',
      'Belagavi',
    ],
    'Telangana': [
      'Hyderabad',
      'Warangal',
      'Nizamabad',
      'Karimnagar',
    ],
    'Madhya Pradesh': [
      'Bhopal',
      'Indore',
      'Gwalior',
      'Jabalpur',
      'Ujjain',
    ],
  };

  @override
  void dispose() {
    nameController.dispose();
    emailController.dispose();
    usernameController.dispose();
    super.dispose();
  }

  void signup() {
    if (_formKey.currentState!.validate()) {
      if (selectedState == null || selectedCity == null) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(
            content: Text('Please select state and city'),
          ),
        );
        return;
      }

      // API call will be implemented here later.

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Signup form submitted'),
        ),
      );

      print('Name: ${nameController.text}');
      print('Email: ${emailController.text}');
      print('Username: ${usernameController.text}');
      print('State: $selectedState');
      print('City: $selectedCity');
    }
  }

  InputDecoration inputDecoration({
    required String label,
    required IconData icon,
  }) {
    return InputDecoration(
      labelText: label,
      prefixIcon: Icon(
        icon,
        color: const Color(0xFF6A1B9A),
      ),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: BorderSide(
          color: Colors.grey.shade300,
        ),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
        borderSide: const BorderSide(
          color: Color(0xFF6A1B9A),
          width: 2,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F4FA),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24),
            child: Container(
              constraints: const BoxConstraints(
                maxWidth: 500,
              ),
              padding: const EdgeInsets.all(32),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.08),
                    blurRadius: 20,
                    offset: const Offset(0, 8),
                  ),
                ],
              ),
              child: Form(
                key: _formKey,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [

                    // Logo / Icon
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

                    const SizedBox(height: 20),

                    const Center(
                      child: Text(
                        'Create Account',
                        style: TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF2D143B),
                        ),
                      ),
                    ),

                    const SizedBox(height: 8),

                    const Center(
                      child: Text(
                        'Create your account to get started',
                        style: TextStyle(
                          fontSize: 14,
                          color: Colors.grey,
                        ),
                      ),
                    ),

                    const SizedBox(height: 30),

                    // Name
                    TextFormField(
                      controller: nameController,
                      textInputAction: TextInputAction.next,
                      decoration: inputDecoration(
                        label: 'Full Name',
                        icon: Icons.person_outline,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 18),

                    // Email
                    TextFormField(
                      controller: emailController,
                      keyboardType: TextInputType.emailAddress,
                      textInputAction: TextInputAction.next,
                      decoration: inputDecoration(
                        label: 'Email Address',
                        icon: Icons.email_outlined,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter your email';
                        }

                        final emailRegex = RegExp(
                          r'^[^@\s]+@[^@\s]+\.[^@\s]+$',
                        );

                        if (!emailRegex.hasMatch(value.trim())) {
                          return 'Please enter a valid email';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 18),

                    // Username
                    TextFormField(
                      controller: usernameController,
                      textInputAction: TextInputAction.next,
                      decoration: inputDecoration(
                        label: 'Username',
                        icon: Icons.alternate_email,
                      ),
                      validator: (value) {
                        if (value == null || value.trim().isEmpty) {
                          return 'Please enter username';
                        }

                        if (value.trim().length < 4) {
                          return 'Username must be at least 4 characters';
                        }

                        return null;
                      },
                    ),

                    const SizedBox(height: 18),

                    // State
                    DropdownButtonFormField<String>(
                      value: selectedState,
                      decoration: inputDecoration(
                        label: 'State',
                        icon: Icons.location_on_outlined,
                      ),
                      items: states.map((state) {
                        return DropdownMenuItem<String>(
                          value: state,
                          child: Text(state),
                        );
                      }).toList(),
                      onChanged: (value) {
                        setState(() {
                          selectedState = value;

                          // Reset city whenever state changes
                          selectedCity = null;
                        });
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select state';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 18),

                    // City
                    DropdownButtonFormField<String>(
                      value: selectedCity,
                      decoration: inputDecoration(
                        label: 'City',
                        icon: Icons.location_city_outlined,
                      ),
                      hint: Text(
                        selectedState == null
                            ? 'Select state first'
                            : 'Select city',
                      ),
                      items: selectedState == null
                          ? []
                          : cities[selectedState]!.map((city) {
                              return DropdownMenuItem<String>(
                                value: city,
                                child: Text(city),
                              );
                            }).toList(),
                      onChanged: selectedState == null
                          ? null
                          : (value) {
                              setState(() {
                                selectedCity = value;
                              });
                            },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Please select city';
                        }
                        return null;
                      },
                    ),

                    const SizedBox(height: 30),

                    // Signup Button
                    SizedBox(
                      width: double.infinity,
                      height: 52,
                      child: ElevatedButton(
                        onPressed: signup,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: const Color(0xFF6A1B9A),
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ),
                        child: const Text(
                          'Create Account',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 20),

                    // Login
                    Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Already have an account? ',
                            style: TextStyle(
                              color: Colors.grey,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pop(context);
                            },
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Color(0xFF6A1B9A),
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
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