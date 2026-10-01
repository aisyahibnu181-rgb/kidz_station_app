import 'package:kidz_station_app/data/dummy_data.dart';
import 'package:kidz_station_app/theme/app_theme.dart';
import 'package:kidz_station_app/widgets/banner_carousel.dart';
import 'package:kidz_station_app/widgets/category_chip.dart';
import 'package:kidz_station_app/widgets/home_header.dart';
import 'package:kidz_station_app/widgets/profile_sheet.dart';
import 'package:kidz_station_app/widgets/search-field.dart';
import 'package:flutter/material.dart';

class HomeContentHeader extends StatelessWidget {
  const HomeContentHeader({super.key, required this.selectedCategory,
  required this.categories, 
  required this.onQueryChange, 
  required this.onCategorySelected});


  final String selectedCategory;
  final List<String> categories;
  final ValueChanged<String> onQueryChange;
  final ValueChanged<String> onCategorySelected;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.fromLTRB(20, 12, 20, 0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          HomeHeader(onProfileTap: () => showProfileSheet(context)),
          SizedBox(height: 18),
          BannerCarousel(banners: dummyBanners),
          SizedBox(height: 20),
          SearchField(onChange: onQueryChange),
          SizedBox(height: 18),
          CategoryChipList(
            categories: categories,
            selectedCategory: selectedCategory,
            onSelected: onCategorySelected,
          ),
          SizedBox(height: 22),
          Text(
            'Rekomendasi Untukmu',
            style: AppTheme.display(fontSize: 18),
          ),
          SizedBox(height: 14),
        ],
      ),
    );
  }
}