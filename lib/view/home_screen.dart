import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../viewmodels/user_view_model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  @override
  void initState() {
    super.initState();

    // Call API after the first frame is rendered
    WidgetsBinding.instance.addPostFrameCallback((_) {
      context.read<UserViewModel>().fetchUsers();
    });
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(
        title: const Text("MVVM + Provider"),
        centerTitle: true,
      ),

      body: Consumer<UserViewModel>(
        builder: (context, viewModel, child) {

          // Loading
          if (viewModel.isLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }

          // Error
          if (viewModel.errorMessage.isNotEmpty) {
            return Center(
              child: Text(
                viewModel.errorMessage,
                style: const TextStyle(
                  color: Colors.red,
                  fontSize: 18,
                ),
              ),
            );
          }

          // User List
          return ListView.builder(
            itemCount: viewModel.users.length,
            itemBuilder: (context, index) {

              final user = viewModel.users[index];

              return Card(
                margin: const EdgeInsets.all(10),

                child: ListTile(

                  leading: CircleAvatar(
                    child: Text(
                      user.id.toString(),
                    ),
                  ),

                  title: Text(user.name),

                  subtitle: Text(user.email),

                ),
              );

            },
          );
        },
      ),
    );
  }
}