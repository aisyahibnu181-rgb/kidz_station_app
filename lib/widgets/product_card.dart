import 'package:kidz_station_app/models/product.dart';
import 'package:kidz_station_app/state/favorites_controller.dart';
import 'package:kidz_station_app/theme/app_theme.dart';
import 'package:kidz_station_app/widgets/product_image.dart';
import 'package:flutter/material.dart';

class ProductCard extends StatelessWidget {
  const ProductCard({super.key, required this.product, required this.onTap});

  final Product product;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    // InkWell yang bisa sensitif dengan touch
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(20),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              color: AppTheme.primaryDark.withValues(alpha: 0.08),
              blurRadius: 16,
              // offset punya bosha adalah shadownya mau kemana nih
              offset: Offset(0, 6)
            )
          ]
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Expanded(
              child: Stack(
                fit: StackFit.expand,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20)
                    ),
                    child: Hero(
                      tag: 'product-image-${product.id}',
                      child: ProductNetworkImage(
                        imageUrl: product.imageUrl,
                        fallbackIcon: product.icon,
                        fallbackColor: product.color,
                      ),
                    ),
                  ),
                  // untuk mendifinisakan pose widget didalam cardnya itu seperti apa
                  Positioned(
                    top: 6,
                    left: 6,
                    child: _RatingChip(rating: product.rating),
                  ),
                  // untuk handling favorites button
                  Positioned(
                    top: 6,
                    right: 6,
                    child: ValueListenableBuilder<Set<String>>(
                      // dia bisa mendengarkan action dari user (diklik)
                      valueListenable: FavoritesController.instance,
                      builder: (context, favorites, _) {
                        final isFav = favorites.contains(product.id);
                        // InkWell: area yang bisa menerima atau sensitif dengan touch
                        return InkWell(
                          borderRadius: BorderRadius.circular(20),
                          onTap: () => FavoritesController.instance.toggle(product.id), // FavController.instance
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: Colors.white,
                            child: Icon(
                              isFav ? Icons.favorite : Icons.favorite_border,
                              size: 18,
                              color: isFav ? AppTheme.primary : Colors.grey,
                            ),
                          ),
                        );
                      } ,
                    ),
                  )
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(12, 10, 12, 12),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    product.name,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 14,
                      color: AppTheme.textPrimary,
                    ),
                  ),
                  SizedBox(height: 5),
                  Text(
                    formatRupiah(product.price),
                    style: TextStyle(
                      color: AppTheme.primaryDark,
                      fontWeight: FontWeight.w400,
                      fontSize: 14
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class _RatingChip extends StatelessWidget {
  const _RatingChip({super.key, required this.rating});

  final double rating;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 7, vertical: 3),
      decoration: BoxDecoration(
        color: Colors.black.withValues(alpha: 0.45),
        borderRadius: BorderRadius.circular(20)
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star_rounded, size: 13, color: Colors.amber),
          SizedBox(width: 3),
          Text(
            rating.toString(),
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.w600
            ),
          )
        ],
      ),
    );
  }
}