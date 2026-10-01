import 'package:kidz_station_app/models/product.dart';
import 'package:kidz_station_app/theme/app_theme.dart';
import 'package:kidz_station_app/widgets/detail_header.dart';
import 'package:kidz_station_app/widgets/detail_total.dart';
import 'package:kidz_station_app/widgets/product_summary.dart';
import 'package:kidz_station_app/widgets/quantity_stepper.dart';
import 'package:kidz_station_app/widgets/sheet_drag_handle.dart';
import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({super.key, required this.product});

  final Product product;

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  // nilai ini "HIDUP" selama widget state ini ada setiap kali di ubah oleh setState flutter akan melakukan rebuild supaya tampilan ikut ter update
int _quantity = 1;

void _increment() => setState(() => _quantity++);

void _decrement() {
  if (_quantity > 1) {
    setState(() => _quantity--);
  }
}

void _addToCart() {
  final product = widget.product;
  ScaffoldMessenger.of(context).showSnackBar(
    SnackBar(
      content: Text('$_quantity x ${product.name} ditambahkan ke keranjang'),
    )
  );
}

  @override
  Widget build(BuildContext context) {
    final product = widget.product;

    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          DetailHeader(product: product, onBack:  () => Navigator.of(context).pop()),
          Expanded(
            child: Container(
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(28)),
              ),
              child: SingleChildScrollView(
                padding: EdgeInsets.fromLTRB(22, 22, 22, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SheetDragHandle(),
                    SizedBox(height: 20),
                    ProductSummary(product: product),
                    SizedBox(height: 22),
                    Text(
                      'Deskripsi',
                      style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w700,
                        color: AppTheme.textPrimary,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      product.description,
                      style: TextStyle(
                        color:  AppTheme.textSecondary,
                        height: 1.6,
                        fontSize: 13.5,
                      ),
                    ),
                    SizedBox(height: 26),
                    QuantityStepper(
                      quantity: _quantity,
                      onIncrement: _increment,
                      onDecrement: _decrement,
                    )
                  ],
                ),
              ),
            ),
          )
        ],
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
      floatingActionButton: FloatingActionButton.extended(
        onPressed: _addToCart,
        backgroundColor: AppTheme.primary,
        foregroundColor: Colors.white,
        elevation: 2,
        icon: Icon(Icons.shopping_bag_outlined, size: 20),
        label: Text('Tambah', style: TextStyle(fontWeight: FontWeight.w700)),
      ),
      bottomNavigationBar: DetailTotalBar(totalPrice: product.price * _quantity),
    );
  }
}