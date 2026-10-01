import 'package:kidz_station_app/models/product.dart';
import 'package:kidz_station_app/state/favorites_controller.dart';
import 'package:kidz_station_app/theme/app_theme.dart';
import 'package:kidz_station_app/widgets/circle_icon_button.dart';
import 'package:kidz_station_app/widgets/product_image.dart';
import 'package:flutter/material.dart';

class DetailHeader extends StatelessWidget {
  const DetailHeader({super.key, required this.product, required this.onBack});

  final Product product;
  final VoidCallback onBack;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      width: double.infinity,
      child: Stack(
        children: [
          Positioned.fill(
            child: Hero(
              tag:  'product-image-${product.id}',
              child: ProductNetworkImage(
                imageUrl: product.imageUrl,
                fallbackIcon: product.icon,
                fallbackColor: product.color,
              ),
            ),
          ),
          SafeArea(
            child: Padding(
              padding: EdgeInsets.all(16.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleIconButton(
                    icon: Icons.arrow_back_rounded,
                    onTap: onBack,
                  ),
                  _FavoriteButton(productId: product.id)
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}

class _FavoriteButton extends StatelessWidget {
  const _FavoriteButton({super.key, required this.productId});

  final String productId;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder<Set<String>>(
      valueListenable:FavoritesController.instance,
      builder: (context, favoritesId, _) {
        final isFavorite = favoritesId.contains(productId);
        return CircleIconButton (
        icon: isFavorite ? Icons.favorite_rounded : Icons.favorite_border_rounded,
        iconColor: isFavorite ? AppTheme.primary : Colors.black87,
        onTap: () => FavoritesController.instance.toggle(productId),
        );
      },
    );
  }
}