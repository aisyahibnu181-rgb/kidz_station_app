import 'package:kidz_station_app/data/dummy_data.dart';
import 'package:kidz_station_app/screens/detail_screen.dart';
import 'package:kidz_station_app/state/favorites_controller.dart';
import 'package:kidz_station_app/theme/app_theme.dart';
import 'package:kidz_station_app/widgets/empty_favorite_state.dart';
import 'package:kidz_station_app/widgets/product_card.dart';
import 'package:flutter/material.dart';
class FavoriteScreen extends StatelessWidget {
  const FavoriteScreen({super.key});
  
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsetsGeometry.fromLTRB(20, 16, 20, 8),
            child: Text('Favorite', style: AppTheme.display(fontSize: 24)),
          ),
          Expanded(
            child: ValueListenableBuilder<Set<String>>(
              valueListenable: FavoritesController.instance,
              builder: (context, favoriteIds, _) {
                final favoriteProducts = dummyProducts
                    .where((product) => favoriteIds.contains(product.id))
                    .toList();
                if (favoriteProducts.isEmpty) {
                  return const EmptyFavoriteState(); //class empty fav state
                }
                return GridView.builder(
                  padding: EdgeInsets.fromLTRB(20, 4, 20, 100),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisSpacing: 16,
                    crossAxisSpacing: 16,
                    childAspectRatio: 0.68,
                  ),
                  itemCount: favoriteProducts.length,
                  itemBuilder: (context, index) {
                    final product = favoriteProducts[index];
                    return ProductCard(
                      product: product, 
                      onTap: () {
                        Navigator.of(context).push(
                          MaterialPageRoute(builder: (_) => DetailScreen(product: product))
                        );
                      }
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}