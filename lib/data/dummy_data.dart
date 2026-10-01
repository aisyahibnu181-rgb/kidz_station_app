import 'package:flutter/material.dart';
import '../models/product.dart';
import '../models/promo_banner.dart';

class DummyUser {
  static const String email = 'demo@kidzstation.com';
  static const String password = 'kidz123';
  static const String name = 'Kidz Station User';
}

// ============================================================
// ALL PRODUCTS
// ============================================================

final List<Product> dummyProducts = [
  // ==========================================================
  // SCHOOL
  // ==========================================================

  Product(
    id: 'school1',
    name: 'Cute Kids Backpack',
    category: 'School',
    price: 125000,
    rating: 4.8,
    description: 'Tas sekolah anak yang ringan dan nyaman.',
    imageUrl:
        'https://images.unsplash.com/photo-1588072432836-e10032774350?auto=format&fit=crop&w=900&q=80',
    icon: Icons.backpack_rounded,
    color: Colors.orange,
  ),

  Product(
    id: 'school2',
    name: 'Kids Notebook',
    category: 'School',
    price: 45000,
    rating: 4.7,
    description: 'Buku catatan lucu untuk kegiatan belajar anak.',
    imageUrl:
        'https://images.unsplash.com/photo-1531346680769-a1d79b57de5b?auto=format&fit=crop&w=900&q=80',
    icon: Icons.menu_book_rounded,
    color: Colors.blue,
  ),

  Product(
    id: 'school3',
    name: 'Colorful Pencil Set',
    category: 'School',
    price: 35000,
    rating: 4.8,
    description: 'Pensil warna untuk menggambar dan belajar.',
    imageUrl:
        'https://images.unsplash.com/photo-1513364776144-60967b0f800f?auto=format&fit=crop&w=900&q=80',
    icon: Icons.edit_rounded,
    color: Colors.purple,
  ),

  Product(
    id: 'school4',
    name: 'Cute School Bag',
    category: 'School',
    price: 145000,
    rating: 4.9,
    description: 'Tas sekolah dengan desain lucu dan menarik.',
    imageUrl:
        'https://images.unsplash.com/photo-1622560480605-d83c853bc5c3?auto=format&fit=crop&w=900&q=80',
    icon: Icons.backpack_rounded,
    color: Colors.pink,
  ),

  // ==========================================================
  // TOYS
  // ==========================================================

  Product(
    id: 'toy1',
    name: 'Soft Teddy Bear',
    category: 'Toys',
    price: 110000,
    rating: 4.8,
    description: 'Boneka teddy bear yang lembut dan nyaman.',
    imageUrl:
        'https://images.unsplash.com/photo-1559454403-b8fb88521f11?auto=format&fit=crop&w=900&q=80',
    icon: Icons.toys_rounded,
    color: Colors.brown,
  ),

  Product(
    id: 'toy2',
    name: 'Building Blocks',
    category: 'Toys',
    price: 89000,
    rating: 4.9,
    description: 'Balok warna-warni untuk bermain dan berkreasi.',
    imageUrl:
        'https://images.unsplash.com/photo-1587654780291-39c9404d746b?auto=format&fit=crop&w=900&q=80',
    icon: Icons.extension_rounded,
    color: Colors.blue,
  ),

  Product(
    id: 'toy3',
    name: 'Toy Car Racer',
    category: 'Toys',
    price: 85000,
    rating: 4.8,
    description: 'Mobil mainan seru untuk menemani waktu bermain.',
    imageUrl:
        'https://images.unsplash.com/photo-1594787318286-3d835c1d207f?auto=format&fit=crop&w=900&q=80',
    icon: Icons.directions_car_rounded,
    color: Colors.red,
  ),

  Product(
    id: 'toy4',
    name: 'Cute Doll',
    category: 'Toys',
    price: 95000,
    rating: 4.7,
    description: 'Boneka lucu sebagai teman bermain anak.',
    imageUrl:
        'https://images.unsplash.com/photo-1599623560574-39d485900c95?auto=format&fit=crop&w=900&q=80',
    icon: Icons.toys_rounded,
    color: Colors.pink,
  ),

  // ==========================================================
  // ART & CRAFT
  // ==========================================================

  Product(
    id: 'art1',
    name: 'Coloring Set',
    category: 'Art & Craft',
    price: 65000,
    rating: 4.7,
    description: 'Set mewarnai untuk membantu anak berkreasi.',
    imageUrl:
        'https://images.unsplash.com/photo-1513364776144-60967b0f800f?auto=format&fit=crop&w=900&q=80',
    icon: Icons.palette_rounded,
    color: Colors.pink,
  ),

  Product(
    id: 'art2',
    name: 'Art Set 68 Pcs',
    category: 'Art & Craft',
    price: 95000,
    rating: 4.8,
    description: 'Peralatan seni lengkap untuk anak.',
    imageUrl:
        'https://images.unsplash.com/photo-1541961017774-22349e4a1262?auto=format&fit=crop&w=900&q=80',
    icon: Icons.palette_rounded,
    color: Colors.orange,
  ),

  Product(
    id: 'art3',
    name: 'Drawing Book',
    category: 'Art & Craft',
    price: 28000,
    rating: 4.5,
    description: 'Buku gambar untuk menggambar dan mewarnai.',
    imageUrl:
        'https://images.unsplash.com/photo-1513475382585-d06e58bcb0e0?auto=format&fit=crop&w=900&q=80',
    icon: Icons.menu_book_rounded,
    color: Colors.deepPurple,
  ),

  Product(
    id: 'art4',
    name: 'Kids Painting Kit',
    category: 'Art & Craft',
    price: 78000,
    rating: 4.8,
    description: 'Peralatan melukis sederhana untuk anak.',
    imageUrl:
        'https://images.unsplash.com/photo-1460661419201-fd4cecdf8a8b?auto=format&fit=crop&w=900&q=80',
    icon: Icons.brush_rounded,
    color: Colors.green,
  ),

  // ==========================================================
  // GAMES
  // ==========================================================

  Product(
    id: 'game1',
    name: 'Puzzle Animals',
    category: 'Games',
    price: 72000,
    rating: 4.7,
    description: 'Puzzle hewan untuk melatih fokus anak.',
    imageUrl:
        'https://images.unsplash.com/photo-1618842676088-c4d48a6a7c9d?auto=format&fit=crop&w=900&q=80',
    icon: Icons.extension_rounded,
    color: Colors.amber,
  ),

  Product(
    id: 'game2',
    name: 'Creative Puzzle',
    category: 'Games',
    price: 68000,
    rating: 4.6,
    description: 'Puzzle kreatif dengan desain menarik.',
    imageUrl:
        'https://images.unsplash.com/photo-1596461404969-9ae70f2830c1?auto=format&fit=crop&w=900&q=80',
    icon: Icons.extension_rounded,
    color: Colors.green,
  ),

  Product(
    id: 'game3',
    name: 'Kids Board Game',
    category: 'Games',
    price: 85000,
    rating: 4.8,
    description: 'Permainan papan seru untuk dimainkan bersama.',
    imageUrl:
        'https://images.unsplash.com/photo-1606503153255-59d8b8b821f0?auto=format&fit=crop&w=900&q=80',
    icon: Icons.games_rounded,
    color: Colors.blue,
  ),

  Product(
    id: 'game4',
    name: 'Memory Card Game',
    category: 'Games',
    price: 55000,
    rating: 4.7,
    description: 'Permainan kartu untuk melatih daya ingat anak.',
    imageUrl:
        'https://images.unsplash.com/photo-1610890716171-6b1bb98ffd09?auto=format&fit=crop&w=900&q=80',
    icon: Icons.style_rounded,
    color: Colors.purple,
  ),

  // ==========================================================
  // KIDS ESSENTIALS
  // ==========================================================

  Product(
    id: 'essential1',
    name: 'Cute Lunch Box',
    category: 'Kids Essentials',
    price: 55000,
    rating: 4.6,
    description: 'Kotak makan praktis untuk membawa bekal.',
    imageUrl:
        'https://images.unsplash.com/photo-1601050690597-df0568f70950?auto=format&fit=crop&w=900&q=80',
    icon: Icons.lunch_dining_rounded,
    color: Colors.green,
  ),

  Product(
    id: 'essential2',
    name: 'Kids Water Bottle',
    category: 'Kids Essentials',
    price: 48000,
    rating: 4.6,
    description: 'Botol minum praktis untuk anak.',
    imageUrl:
        'https://images.unsplash.com/photo-1602143407151-7111542de6e8?auto=format&fit=crop&w=900&q=80',
    icon: Icons.water_drop_rounded,
    color: Colors.cyan,
  ),

  Product(
    id: 'essential3',
    name: 'Kids Daily Bag',
    category: 'Kids Essentials',
    price: 85000,
    rating: 4.7,
    description: 'Tas kecil untuk membawa perlengkapan anak.',
    imageUrl:
        'https://images.unsplash.com/photo-1548036328-c9fa89d128fa?auto=format&fit=crop&w=900&q=80',
    icon: Icons.shopping_bag_rounded,
    color: Colors.pink,
  ),

  Product(
    id: 'essential4',
    name: 'Kids Snack Box',
    category: 'Kids Essentials',
    price: 42000,
    rating: 4.7,
    description: 'Kotak bekal kecil untuk menyimpan makanan dan snack.',
    imageUrl:
        'https://images.unsplash.com/photo-1556911220-e15b29be8c8f?auto=format&fit=crop&w=900&q=80',
    icon: Icons.lunch_dining_rounded,
    color: Colors.orange,
  ),
];

// ============================================================
// POPULAR PICKS
// ============================================================
//
// Produk khusus untuk bagian Popular Picks.
// Jadi TIDAK mengambil produk dari dummyProducts.
//

final List<Product> popularProducts = [
  Product(
    id: 'popular1',
    name: 'Teddy Bear Classic',
    category: 'Toys',
    price: 75000,
    rating: 4.9,
    description:
        'Boneka teddy bear klasik yang lembut dan cocok menjadi teman bermain anak.',
    imageUrl:
        'https://images.unsplash.com/photo-1559454403-b8fb88521f11?auto=format&fit=crop&w=900&q=80',
    icon: Icons.toys_rounded,
    color: Colors.brown,
  ),

  Product(
    id: 'popular2',
    name: 'Kids Backpack Unicorn',
    category: 'School',
    price: 120000,
    rating: 4.9,
    description:
        'Tas anak dengan desain unicorn yang lucu dan cocok digunakan untuk sekolah.',
    imageUrl:
        'https://images.unsplash.com/photo-1588072432836-e10032774350?auto=format&fit=crop&w=900&q=80',
    icon: Icons.backpack_rounded,
    color: Colors.pink,
  ),

  Product(
    id: 'popular3',
    name: 'Art Set 68 Pcs',
    category: 'Art & Craft',
    price: 95000,
    rating: 4.8,
    description:
        'Set alat seni lengkap untuk menggambar, mewarnai, dan membuat berbagai karya kreatif.',
    imageUrl:
        'https://images.unsplash.com/photo-1513364776144-60967b0f800f?auto=format&fit=crop&w=900&q=80',
    icon: Icons.palette_rounded,
    color: Colors.orange,
  ),

  Product(
    id: 'popular4',
    name: 'Toy Car Racer',
    category: 'Toys',
    price: 85000,
    rating: 4.8,
    description:
        'Mobil mainan keren untuk menemani anak bermain dan membuat berbagai permainan seru.',
    imageUrl:
        'https://images.unsplash.com/photo-1558877385-81a1c7d1e9f5?auto=format&fit=crop&w=900&q=80',
    icon: Icons.directions_car_rounded,
    color: Colors.red,
  ),
];

// ============================================================
// PROMO BANNERS
// ============================================================

final List<PromoBanner> dummyBanners = [
  PromoBanner(
    title: 'Back to School',
    subtitle:
        'Lengkapi kebutuhan sekolah si kecil dengan pilihan favorit.',
    imageUrl:
        'https://images.unsplash.com/photo-1503676260728-1c00da094a0b?auto=format&fit=crop&w=1000&q=80',
    gradientColors: [
      Color(0xFF5B6CFF),
      Color(0xFF8A5CF6),
    ],
  ),

  PromoBanner(
    title: 'Fun & Creative',
    subtitle:
        'Temukan mainan dan perlengkapan kreatif untuk waktu bermain.',
    imageUrl:
        'https://images.unsplash.com/photo-1596461404969-9ae70f2830c1?auto=format&fit=crop&w=1000&q=80',
    gradientColors: [
      Color(0xFFFF7A59),
      Color(0xFFFFB347),
    ],
  ),

  PromoBanner(
    title: 'Special Kids Picks',
    subtitle:
        'Pilihan produk lucu dan berguna untuk anak-anak.',
    imageUrl:
        'https://images.unsplash.com/photo-1516627145497-ae6968895b74?auto=format&fit=crop&w=1000&q=80',
    gradientColors: [
      Color(0xFF25BFA4),
      Color(0xFF4DD6C0),
    ],
  ),
];