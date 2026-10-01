import 'package:flutter/material.dart';
import 'package:kidz_station_app/data/dummy_data.dart';
import 'package:kidz_station_app/models/product.dart';
import 'package:kidz_station_app/screens/detail_screen.dart';
import 'package:kidz_station_app/widgets/product_card.dart';
import 'package:kidz_station_app/widgets/home_content_header.dart';
import 'package:kidz_station_app/theme/app_theme.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  String _query = '';
  String _selectedCategory = 'Semua';

  // ==========================================================
  // CATEGORY
  // ==========================================================

  List<String> get _categories {
    final unique = <String>{
      'Semua',
      ...dummyProducts.map((product) => product.category),
    };

    return unique.toList();
  }

  // ==========================================================
  // FILTER PRODUCTS
  // ==========================================================

  List<Product> get _filteredProducts {
    return dummyProducts.where((product) {
      final matchesQuery = product.name
          .toLowerCase()
          .contains(_query.toLowerCase());

      final matchesCategory =
          _selectedCategory == 'Semua' ||
          product.category == _selectedCategory;

      return matchesQuery && matchesCategory;
    }).toList();
  }

  // ==========================================================
  // OPEN DETAIL
  // ==========================================================

  void _openDetail(Product product) {
    Navigator.of(context).push(
      MaterialPageRoute(
        builder: (_) => DetailScreen(
          product: product,
        ),
      ),
    );
  }

  // ==========================================================
  // PRICE FORMAT
  // ==========================================================

  String _formatPrice(double price) {
    return 'Rp${price.toStringAsFixed(0).replaceAllMapped(
          RegExp(r'\B(?=(\d{3})+(?!\d))'),
          (match) => '.',
        )}';
  }

  // ==========================================================
  // BUILD
  // ==========================================================

  @override
  Widget build(BuildContext context) {
    final products = _filteredProducts;

    return SafeArea(
      child: CustomScrollView(
        slivers: [
          // ====================================================
          // HEADER + SEARCH
          // ====================================================

          SliverToBoxAdapter(
            child: HomeContentHeader(
              selectedCategory: _selectedCategory,
              categories: _categories,
              onQueryChange: (value) {
                setState(() {
                  _query = value;
                });
              },
              onCategorySelected: (value) {
                setState(() {
                  _selectedCategory = value;
                });
              },
            ),
          ),

          // ====================================================
          // HERO BANNER
          // ====================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                5,
                20,
                25,
              ),
              child: Container(
                height: 175,
                decoration: BoxDecoration(
                  gradient: const LinearGradient(
                    colors: [
                      AppTheme.yellow,
                      Color(0xFFFFD966),
                    ],
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                  ),
                  borderRadius: BorderRadius.circular(28),
                  boxShadow: [
                    BoxShadow(
                      color: AppTheme.yellow.withOpacity(0.20),
                      blurRadius: 15,
                      offset: const Offset(0, 7),
                    ),
                  ],
                ),
                child: Stack(
                  children: [
                    // Decorative circle
                    Positioned(
                      right: -35,
                      top: -45,
                      child: Container(
                        width: 155,
                        height: 155,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.18),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    Positioned(
                      right: 20,
                      bottom: -55,
                      child: Container(
                        width: 125,
                        height: 125,
                        decoration: BoxDecoration(
                          color: Colors.white.withOpacity(0.15),
                          shape: BoxShape.circle,
                        ),
                      ),
                    ),

                    // Banner content
                    Padding(
                      padding: const EdgeInsets.all(22),
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'BACK TO SCHOOL',
                            style: AppTheme.caption(
                              fontSize: 12,
                              fontWeight: FontWeight.w800,
                              color: AppTheme.primaryDark,
                            ).copyWith(
                              letterSpacing: 1.2,
                            ),
                          ),

                          const SizedBox(height: 7),

                          Text(
                            'Ready for a\nfun new day?',
                            style: AppTheme.display(
                              fontSize: 24,
                              fontWeight: FontWeight.w700,
                              color: AppTheme.textPrimary,
                            ).copyWith(
                              height: 1.05,
                            ),
                          ),

                          const Spacer(),

                          Container(
                            padding: const EdgeInsets.symmetric(
                              horizontal: 15,
                              vertical: 8,
                            ),
                            decoration: BoxDecoration(
                              color: AppTheme.primary,
                              borderRadius:
                                  BorderRadius.circular(18),
                            ),
                            child: Text(
                              'Shop Now',
                              style: AppTheme.button(
                                fontSize: 12,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),

                    // Backpack icon
                    const Positioned(
                      right: 27,
                      top: 52,
                      child: Text(
                        '🎒',
                        style: TextStyle(
                          fontSize: 65,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ====================================================
          // SHOP BY CATEGORY
          // ====================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20,
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Shop by Category',
                    style: AppTheme.display(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primary,
                    ),
                  ),

                  TextButton(
                    onPressed: () {
                      setState(() {
                        _selectedCategory = 'Semua';
                      });
                    },
                    child: Text(
                      'See All',
                      style: AppTheme.button(
                        fontSize: 12,
                        color: AppTheme.primary,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ====================================================
          // CATEGORY CIRCLES
          // ====================================================

          SliverToBoxAdapter(
          child: Padding(
            padding: const EdgeInsets.only(
              top: 25,
            ),
            child: SizedBox(
              height: 135,
              child: ListView(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                children: [
                  _categoryItem(
                    icon: Icons.backpack_rounded,
                    title: 'School',
                    category: 'School',
                    color: AppTheme.primary,
                  ),

                  _categoryItem(
                    icon: Icons.toys_rounded,
                    title: 'Toys',
                    category: 'Toys',
                    color: AppTheme.red,
                  ),

                  _categoryItem(
                    icon: Icons.palette_rounded,
                    title: 'Art',
                    category: 'Art & Craft',
                    color: AppTheme.orange,
                  ),

                  _categoryItem(
                    icon: Icons.extension_rounded,
                    title: 'Games',
                    category: 'Games',
                    color: AppTheme.leaf,
                  ),

                  _categoryItem(
                    icon: Icons.water_drop_rounded,
                    title: 'Essentials',
                    category: 'Kids Essentials',
                    color: AppTheme.purple,
                  ),
                ],
              ),
            ),
          ),
          ),

          // ====================================================
          // POPULAR PRODUCT
          // ====================================================

          SliverToBoxAdapter(
            child: SizedBox(
              height: 215,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                padding: const EdgeInsets.symmetric(
                  horizontal: 20,
                ),
                itemCount: popularProducts.length,
                itemBuilder: (context, index) {
                  final product = popularProducts[index];

                  return GestureDetector(
                    onTap: () => _openDetail(product),
                    child: Container(
                      width: 285,
                      margin: const EdgeInsets.only(
                        right: 15,
                      ),
                      padding: const EdgeInsets.all(11),
                      decoration: BoxDecoration(
                        color: AppTheme.surface,
                        borderRadius:
                            BorderRadius.circular(22),
                        border: Border.all(
                          color: AppTheme.primarySoft,
                        ),
                        boxShadow: [
                          BoxShadow(
                            color: AppTheme.primary
                                .withOpacity(0.07),
                            blurRadius: 15,
                            offset: const Offset(0, 6),
                          ),
                        ],
                      ),
                      child: Row(
                        children: [
                          // IMAGE
                          ClipRRect(
                            borderRadius:
                                BorderRadius.circular(17),
                            child: Image.network(
                              product.imageUrl,
                              width: 115,
                              height: 190,
                              fit: BoxFit.cover,
                              errorBuilder:
                                  (context, error, stackTrace) {
                                return Container(
                                  width: 115,
                                  height: 190,
                                  color: product.color
                                      .withOpacity(0.12),
                                  child: Icon(
                                    product.icon,
                                    size: 45,
                                    color: product.color,
                                  ),
                                );
                              },
                            ),
                          ),

                          const SizedBox(width: 13),

                          // PRODUCT INFORMATION
                          Expanded(
                            child: Column(
                              crossAxisAlignment:
                                  CrossAxisAlignment.start,
                              mainAxisAlignment:
                                  MainAxisAlignment.center,
                              children: [
                                Container(
                                  padding:
                                      const EdgeInsets.symmetric(
                                    horizontal: 8,
                                    vertical: 4,
                                  ),
                                  decoration: BoxDecoration(
                                    color: product.color
                                        .withOpacity(0.12),
                                    borderRadius:
                                        BorderRadius.circular(10),
                                  ),
                                  child: Text(
                                    product.category,
                                    style: AppTheme.caption(
                                      fontSize: 9,
                                      fontWeight:
                                          FontWeight.w700,
                                      color: product.color,
                                    ),
                                  ),
                                ),

                                const SizedBox(height: 10),
                                // Nama Product
                                Text(
                                  product.name,
                                  maxLines: 2,
                                  overflow:TextOverflow.ellipsis,
                                  style: AppTheme.title(
                                    fontSize: 15,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),

                                const SizedBox(height: 8),

                                Row(
                                  children: [
                                    const Icon(
                                      Icons.star_rounded,
                                      size: 17,
                                      color: AppTheme.yellow,
                                    ),

                                    const SizedBox(width: 3),

                                    Text(
                                      product.rating.toString(),
                                      style: AppTheme.caption(
                                        fontSize: 12,
                                        fontWeight:
                                            FontWeight.w700,
                                        color:
                                            AppTheme.textPrimary,
                                      ),
                                    ),
                                  ],
                                ),

                                const SizedBox(height: 8),
                                
                                // Harga Product
                                Text(
                                  _formatPrice(
                                    product.price,
                                  ),
                                  style: AppTheme.price(
                                    fontSize: 15,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ),

          // ====================================================
          // SPECIAL OFFER
          // ====================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                30,
                20,
                25,
              ),
              child: Container(
                padding: const EdgeInsets.all(19),
                decoration: BoxDecoration(
                  color: AppTheme.primary,
                  borderRadius:
                      BorderRadius.circular(25),
                  boxShadow: [
                    BoxShadow(
                      color:
                          AppTheme.primary.withOpacity(0.20),
                      blurRadius: 15,
                      offset: const Offset(0, 7),
                    ),
                  ],
                ),
                child: Row(
                  children: [
                    Container(
                      width: 62,
                      height: 62,
                      decoration: BoxDecoration(
                        color: Colors.white
                            .withOpacity(0.20),
                        shape: BoxShape.circle,
                      ),
                      child: const Center(
                        child: Text(
                          '🎁',
                          style: TextStyle(
                            fontSize: 31,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(width: 14),

                    Expanded(
                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Special Offer!',
                            style: AppTheme.title(
                              fontSize: 18,
                              fontWeight: FontWeight.w800,
                              color: Colors.white,
                            ),
                          ),

                          const SizedBox(height: 5),

                          Text(
                            'Get 20% OFF for your first order',
                            style: AppTheme.caption(
                              fontSize: 11,
                              color: Colors.white70,
                            ),
                          ),
                        ],
                      ),
                    ),

                    Container(
                      padding:
                          const EdgeInsets.symmetric(
                        horizontal: 13,
                        vertical: 9,
                      ),
                      decoration: BoxDecoration(
                        color: AppTheme.yellow,
                        borderRadius:
                            BorderRadius.circular(15),
                      ),
                      child: Text(
                        'Shop',
                        style: AppTheme.button(
                          fontSize: 12,
                          color: AppTheme.textPrimary,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),

          // ====================================================
          // ALL PRODUCTS
          // ====================================================

          SliverToBoxAdapter(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                20,
                0,
                20,
                15,
              ),
              child: Row(
                mainAxisAlignment:
                    MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'All Products',
                    style: AppTheme.display(
                      fontSize: 21,
                      fontWeight: FontWeight.w700,
                      color: AppTheme.primary,
                    ),
                  ),

                  Text(
                    '${products.length} items',
                    style: AppTheme.caption(
                      fontSize: 12,
                      color: AppTheme.textSecondary,
                    ),
                  ),
                ],
              ),
            ),
          ),

          // ====================================================
          // EMPTY STATE
          // ====================================================

          if (products.isEmpty)
            SliverFillRemaining(
              hasScrollBody: false,
              child: Center(
                child: Text(
                  'Produk Tidak Ditemukan',
                  style: AppTheme.title(
                    fontSize: 16,
                    fontWeight: FontWeight.w600,
                    color: AppTheme.textSecondary,
                  ),
                ),
              ),
            )

          // ====================================================
          // ALL PRODUCTS GRID
          // ====================================================

          else
            SliverPadding(
              padding: const EdgeInsets.fromLTRB(
                20,
                0,
                20,
                100,
              ),
              sliver: SliverGrid(
                gridDelegate:
                    const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 16,
                  crossAxisSpacing: 16,
                  childAspectRatio: 0.68,
                ),
                delegate:
                    SliverChildBuilderDelegate(
                  (context, index) {
                    final product = products[index];

                    return ProductCard(
                      product: product,
                      onTap: () {
                        _openDetail(product);
                      },
                    );
                  },
                  childCount: products.length,
                ),
              ),
            ),
        ],
      ),
    );
  }

  // ==========================================================
  // CATEGORY ITEM
  // ==========================================================

  Widget _categoryItem({
    required IconData icon,
    required String title,
    required String category,
    required Color color,
  }) {
    final isSelected =
        _selectedCategory == category;

    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedCategory = category;
        });
      },
      child: Container(
        width: 78,
        margin: const EdgeInsets.only(
          right: 14,
        ),
        child: Column(
          children: [
            AnimatedContainer(
              duration:
                  const Duration(milliseconds: 200),
              width: 56,
              height: 56,
              decoration: BoxDecoration(
                color: isSelected
                    ? color
                    : color.withOpacity(0.12),
                shape: BoxShape.circle,
                border: isSelected
                    ? Border.all(
                        color: color.withOpacity(0.25),
                        width: 3,
                      )
                    : null,
              ),
              child: Icon(
                icon,
                color: isSelected
                    ? Colors.white
                    : color,
                size: 26,
              ),
            ),

            const SizedBox(height: 12),

            // JARAK ICON KE NAMA CATEGORY
            const SizedBox(height: 12),

            // Nama category
            Text(
              title,
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
              textAlign: TextAlign.center,
              style: AppTheme.caption(
                fontSize: 11,
                fontWeight: isSelected
                    ? FontWeight.w700
                    : FontWeight.w600,
                color: isSelected
                    ? color
                    : AppTheme.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }
}