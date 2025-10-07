import 'package:flutter/material.dart';
import 'product_list_page.dart';
import 'cart_page.dart';
import 'login_page.dart';

class UserDashboard extends StatelessWidget {
  const UserDashboard({super.key});

  void _logout(BuildContext context) {
    Navigator.pushReplacement(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Beranda Pengguna'),
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => _logout(context),
          ),
        ],
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              child: const Text("Lihat Produk"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const ProductListPage(isAdmin: false),
                  ),
                );
              },
            ),
            const SizedBox(height: 10),
            ElevatedButton(
              child: const Text("Lihat Keranjang"),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const CartPage()),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
