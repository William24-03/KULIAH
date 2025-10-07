import 'package:flutter/material.dart';
import '../models/product.dart';
import '../services/api_service.dart';

class ProductListPage extends StatefulWidget {
  final bool isAdmin;
  const ProductListPage({super.key, this.isAdmin = false});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

class _ProductListPageState extends State<ProductListPage> {
  List<Product> products = [];

  @override
  void initState() {
    super.initState();
    products = ApiService.getProducts();
  }

  void _deleteProduct(int index) {
    setState(() {
      ApiService.deleteProduct(index);
      products = ApiService.getProducts();
    });
  }

  void _addToCart(Product product) {
    ApiService.addToCart(product);
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Produk ditambahkan ke keranjang!')),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Daftar Produk')),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          final p = products[index];
          return ListTile(
            title: Text(p.name),
            subtitle: Text(
              '${p.description}\nRp ${p.price.toStringAsFixed(0)}',
            ),
            trailing: widget.isAdmin
                ? IconButton(
                    icon: const Icon(Icons.delete, color: Colors.red),
                    onPressed: () => _deleteProduct(index),
                  )
                : IconButton(
                    icon: const Icon(Icons.add_shopping_cart),
                    onPressed: () => _addToCart(p),
                  ),
          );
        },
      ),
    );
  }
}
