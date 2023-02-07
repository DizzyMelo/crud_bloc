import 'package:crud_bloc/controllers/user_controller.dart';
import 'package:crud_bloc/locator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';

class UserListView extends StatefulWidget {
  const UserListView({super.key});

  @override
  State<UserListView> createState() => UserListViewState();
}

class UserListViewState extends State<UserListView> {
  final controller = locator.get<UserController>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Users"),
      ),
      body: SingleChildScrollView(
        child: Observer(builder: (_) {
          if (controller.exception != null) {
            return const Center(child: Text("Something went wrong"));
          }
          return Column(
            children:
                controller.users.map((user) => Text(user.firstName)).toList(),
          );
        }),
      ),
    );
  }

  @override
  void initState() {
    controller.getUsers();
    super.initState();
  }
}
