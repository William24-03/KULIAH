import 'package:flutter/material.dart';
import 'pages/login_page.dart';
import 'pages/admin_dashboard.dart';
import 'pages/user_dashboard.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'E-Commerce Offline',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(primarySwatch: Colors.deepPurple),
      home: const LoginPage(),
      routes: {
        '/admin': (context) => const AdminDashboard(),
        '/user': (context) => const UserDashboard(),
      },
    );
  }
}
