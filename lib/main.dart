import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:one/api.dart';
import 'package:one/controller.dart';
import 'package:one/model.dart';


void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  final UserController userController = Get.put(UserController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Users'),
      ),
      body: Obx(() {
        if (userController.isLoading.value)
          return Center(child: CircularProgressIndicator());
        else
          return ListView.builder(
            itemCount: userController.users.length,
            itemBuilder: (context, index) {
              var user = userController.users[index];
              return ListTile(
                title: Text(user.name),
                subtitle: Text(user.email),
                onTap: () {
                  Get.to(UserDetailsScreen(user: user));
                },
              );
            },
          );
      }),
    );
  }
}

class UserDetailsScreen extends StatelessWidget {
  final User user;

  UserDetailsScreen({required this.user});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(user.name),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('Name: ${user.name}'),
            Text('Email: ${user.email}'),
            Text('ID: ${user.id}'),
          ],
        ),
      ),
    );
  }
}
