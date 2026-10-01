import 'package:kidz_station_app/theme/app_theme.dart';
import 'package:flutter/material.dart';

/**
 * widget ini tidak menyimpan text yang di ketik pengguna nya sendiri.
 * setiap kali pengguna mengetik "onChange" akan di panggil dan HomeScreen yang akan menyimpan textnya lalu memakainya
 * untuk memfilter daftar produk. ini contoh lain dari pola "lifting state"
 */

class SearchField extends StatelessWidget {
  const SearchField({super.key, required this.onChange});

  final ValueChanged<String> onChange;

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChange,
      decoration: InputDecoration(
        hintText: 'Cari Puzzle, Doll, atau Coloring Set...',
        hintStyle: TextStyle(color: AppTheme.textSecondary, fontSize: 13.5),
        prefixIcon: Icon(Icons.search_rounded, color: AppTheme.textSecondary),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(18),
          borderSide: BorderSide.none,
        )
      ),
    );
  }
}