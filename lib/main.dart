import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Restaurant Detail',
      theme: ThemeData(
        scaffoldBackgroundColor: const Color(0xFFF8F9FA),
        fontFamily: 'Roboto',
      ),
      home: const RestaurantDetailPage(),
    );
  }
}

class RestaurantDetailPage extends StatelessWidget {
  const RestaurantDetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // Scrollable Content
          SingleChildScrollView(
            child: Column(
              children: [
                // Header Image with Stack for gradient & navigation
                Stack(
                  children: [
                    Image.network(
                      'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?q=80&w=1000',
                      height: 280,
                      width: double.infinity,
                      fit: BoxFit.cover,
                    ),
                    Container(
                      height: 280,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: [
                            Colors.black.withOpacity(0.6),
                            Colors.transparent,
                            Colors.black.withOpacity(0.4),
                          ],
                        ),
                      ),
                    ),
                    SafeArea(
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.arrow_back, color: Colors.white),
                              onPressed: () {},
                            ),
                            const Text(
                              'Aliyah Restaurant',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                // Tombol Favorit di Header Utama
                                const FavoriteButton(
                                  iconSize: 22,
                                  activeColor: Colors.red,
                                  inactiveColor: Colors.white,
                                ),
                                const SizedBox(width: 8),
                                IconButton(
                                  icon: const Icon(Icons.share_outlined, color: Colors.white),
                                  onPressed: () {},
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),

                // Main Info Section (White Sheet)
                Transform.translate(
                  offset: const Offset(0, -20),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
                    ),
                    padding: const EdgeInsets.all(20),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Title
                        const Text(
                          'Aliyah Restaurant',
                          style: TextStyle(
                            fontSize: 22,
                            fontWeight: FontWeight.bold,
                            color: Color(0xFF1E293B),
                          ),
                        ),
                        const SizedBox(height: 12),

                        // Rating & Tagline Row
                        Row(
                          children: [
                            const Icon(Icons.star_rounded, color: Colors.amber, size: 20),
                            const SizedBox(width: 4),
                            const Text(
                              '4.8',
                              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
                            ),
                            const SizedBox(width: 4),
                            Text(
                              '(1250 Ulasan)',
                              style: TextStyle(color: Colors.grey[600], fontSize: 13),
                            ),
                            const SizedBox(width: 12),
                            Container(
                              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                              decoration: BoxDecoration(
                                color: const Color(0xFFE6F4EA),
                                borderRadius: BorderRadius.circular(6),
                              ),
                              child: Row(
                                children: const [
                                  Icon(Icons.restaurant, size: 12, color: Color(0xFF0F9D58)),
                                  SizedBox(width: 4),
                                  Text(
                                    'Western • Aliyah',
                                    style: TextStyle(
                                      color: Color(0xFF0F9D58),
                                      fontSize: 12,
                                      fontWeight: FontWeight.w600,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Address Row
                        Row(
                          children: [
                            Icon(Icons.location_on_outlined, color: Colors.grey[600], size: 18),
                            const SizedBox(width: 6),
                            Expanded(
                              child: Text(
                                'Jl. Jati Metro No.45, Ternate Selatan',
                                style: TextStyle(color: Colors.grey[600], fontSize: 13),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),

                        // Info Cards (Jarak, Jam, Harga)
                        Container(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                          decoration: BoxDecoration(
                            color: const Color(0xFFF8FAFC),
                            borderRadius: BorderRadius.circular(16),
                            border: Border.all(color: const Color(0xFFE2E8F0)),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            children: [
                              _buildInfoItem(Icons.near_me_outlined, '2.5 km', 'Jarak'),
                              const SizedBox(
                                height: 30,
                                child: VerticalDivider(color: Color(0xFFCBD5E1), thickness: 1),
                              ),
                              _buildInfoItem(Icons.access_time, '10.00 - 22.00', 'Waktu Buka'),
                              const SizedBox(
                                height: 30,
                                child: VerticalDivider(color: Color(0xFFCBD5E1), thickness: 1),
                              ),
                              _buildInfoItem(Icons.account_balance_wallet_outlined, 'Rp 100.000', 'Harga Rata-rata'),
                            ],
                          ),
                        ),
                        const SizedBox(height: 20),

                        // Description
                        Text(
                          'Aliyah Restaurant menghadirkan pengalaman bersantap dengan cita rasa khas Eropa dalam suasana yang hangat dan elegan. Menggunakan bahan-bahan segar pilihan dan racikan chef berpengalaman untuk setiap hidangan istimewa.',
                          style: TextStyle(color: Colors.grey[700], height: 1.5, fontSize: 13),
                        ),
                        const SizedBox(height: 8),

                        // Read More Text
                        InkWell(
                          onTap: () {},
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: const [
                              Text(
                                'Selengkapnya',
                                style: TextStyle(
                                  color: Color(0xFF0F9D58),
                                  fontWeight: FontWeight.bold,
                                  fontSize: 13,
                                ),
                              ),
                              Icon(Icons.keyboard_arrow_down, color: Color(0xFF0F9D58), size: 18),
                            ],
                          ),
                        ),
                        const SizedBox(height: 24),

                        // Popular Menu Header
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            const Text(
                              'Menu Populer',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Color(0xFF1E293B),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Row(
                                children: const [
                                  Text(
                                    'Lihat Semua',
                                    style: TextStyle(color: Color(0xFF0F9D58), fontSize: 13),
                                  ),
                                  Icon(Icons.chevron_right, size: 18, color: Color(0xFF0F9D58)),
                                ],
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 12),

                        // Popular Menu List (Horizontal Scroll)
                        SizedBox(
                          height: 220,
                          child: ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              _buildMenuCard(
                                'Grilled Sirloin Steak',
                                'Rp 145.000',
                                'https://images.unsplash.com/photo-1558030006-450675393462?q=80&w=600',
                              ),
                              _buildMenuCard(
                                'Truffle Carbonara',
                                'Rp 98.000',
                                'https://images.unsplash.com/photo-1612874742237-6526221588e3?q=80&w=600',
                              ),
                              _buildMenuCard(
                                'Grilled Salmon',
                                'Rp 128.000',
                                'https://images.unsplash.com/photo-1467003909585-2f8a72700288?q=80&w=600',
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 80), // Space for bottom floating button
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Floating Bottom Reservation Button
          Positioned(
            left: 20,
            right: 20,
            bottom: 20,
            child: SizedBox(
              width: double.infinity,
              height: 52,
              child: ElevatedButton.icon(
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color(0xFF0F9D58),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(28),
                  ),
                  elevation: 4,
                ),
                onPressed: () {},
                icon: const Icon(Icons.calendar_month_outlined, color: Colors.white),
                label: const Text(
                  'Reservasi Sekarang',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }

  // Helper Widget untuk Item Info (Jarak, Jam, Harga)
  Widget _buildInfoItem(IconData icon, String value, String label) {
    return Column(
      children: [
        Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(icon, size: 16, color: const Color(0xFF0F9D58)),
            const SizedBox(width: 4),
            Text(
              value,
              style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
            ),
          ],
        ),
        const SizedBox(height: 4),
        Text(
          label,
          style: TextStyle(color: Colors.grey[500], fontSize: 11),
        ),
      ],
    );
  }

  // Helper Widget untuk Menu Card Item
  Widget _buildMenuCard(String name, String price, String imageUrl) {
    return Container(
      width: 160,
      margin: const EdgeInsets.only(right: 14),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        border: Border.all(color: const Color(0xFFF1F5F9)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.03),
            blurRadius: 8,
            offset: const Offset(0, 4),
          ),
        ],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              ClipRRect(
                borderRadius: const BorderRadius.vertical(top: Radius.circular(16)),
                child: Image.network(
                  imageUrl,
                  height: 110,
                  width: double.infinity,
                  fit: BoxFit.cover,
                ),
              ),
              Positioned(
                top: 8,
                right: 8,
                child: Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    shape: BoxShape.circle,
                  ),
                  // Menggunakan Widget Interactive FavoriteButton
                  child: const FavoriteButton(
                    iconSize: 16,
                    activeColor: Colors.red,
                    inactiveColor: Colors.black54,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.all(10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 13),
                ),
                const SizedBox(height: 8),
                Text(
                  price,
                  style: const TextStyle(
                    color: Color(0xFF0F9D58),
                    fontWeight: FontWeight.bold,
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

// Custom Component Widget untuk Tombol Favorit
class FavoriteButton extends StatefulWidget {
  final double iconSize;
  final Color activeColor;
  final Color inactiveColor;

  const FavoriteButton({
    super.key,
    this.iconSize = 20,
    this.activeColor = Colors.red,
    this.inactiveColor = Colors.black54,
  });

  @override
  State<FavoriteButton> createState() => _FavoriteButtonState();
}

class _FavoriteButtonState extends State<FavoriteButton> {
  bool isFavorite = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() {
          isFavorite = !isFavorite;
        });
      },
      child: Icon(
        isFavorite ? Icons.favorite : Icons.favorite_border,
        color: isFavorite ? widget.activeColor : widget.inactiveColor,
        size: widget.iconSize,
      ),
    );
  }
}