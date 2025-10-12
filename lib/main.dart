import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});
  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;
    final bool isWide = screenWidth > 600;
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 239, 226, 174),
      appBar: AppBar(
        title: const Text('🍜 Menu 🍜'),
        centerTitle: true,
        backgroundColor: Colors.orangeAccent,
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(color: Colors.orangeAccent),
              child: Center(
                child: Text(
                  'Danh mục món ăn',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                    color: Colors.white,
                  ),
                ),
              ),
            ),
            ListTile(
              leading: Icon(Icons.restaurant_menu_outlined),
              title: Text('Món chính'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Xem món chính')));
              },
            ),
            ListTile(
              leading: Icon(Icons.cake_outlined),
              title: Text('Tráng miệng'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Xem tráng miệng')));
              },
            ),
            ListTile(
              leading: Icon(Icons.local_drink_outlined),
              title: Text('Đồ uống'),
              onTap: () {
                Navigator.pop(context);
                ScaffoldMessenger.of(
                  context,
                ).showSnackBar(SnackBar(content: Text('Xem đồ uống')));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              padding: EdgeInsets.all(10),
              child: Center(
                child: Text(
                  '🍽️ Thực đơn hôm nay 🍽️',
                  style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                ),
              ),
            ),
            isWide
                ? Wrap(
                    spacing: 20,
                    runSpacing: 20,
                    alignment: WrapAlignment.center,
                    children: const [
                      MenuCard(
                        title: 'Phở bò',
                        price: 45000,
                        imageName: 'phobo.webp',
                        color: Colors.redAccent,
                      ),
                      MenuCard(
                        title: 'Bún chả',
                        price: 40000,
                        imageName: 'buncha.webp',
                        color: Colors.redAccent,
                      ),
                      MenuCard(
                        title: 'Bún bò',
                        price: 45000,
                        imageName: 'bunbo.jpg',
                        color: Colors.redAccent,
                      ),
                      MenuCard(
                        title: 'Cơm tấm',
                        price: 35000,
                        imageName: 'comtam.jpg',
                        color: Colors.redAccent,
                      ),
                    ],
                  )
                : Column(
                    children: const [
                      MenuCard(
                        title: 'Phở bò',
                        price: 45000,
                        imageName: 'phobo.webp',
                        color: Colors.redAccent,
                      ),
                      SizedBox(height: 16),
                      MenuCard(
                        title: 'Bún chả',
                        price: 40000,
                        imageName: 'buncha.webp',
                        color: Colors.redAccent,
                      ),
                      SizedBox(height: 16),
                      MenuCard(
                        title: 'Bún bò',
                        price: 45000,
                        imageName: 'bunbo.jpg',
                        color: Colors.redAccent,
                      ),
                      SizedBox(height: 16),
                      MenuCard(
                        title: 'Cơm tấm',
                        price: 35000,
                        imageName: 'comtam.jpg',
                        color: Colors.redAccent,
                      ),
                    ],
                  ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.deepOrange,
        icon: const Icon(Icons.add_shopping_cart_outlined),
        label: const Text('Đặt món', style: TextStyle(color: Colors.white)),
        onPressed: () {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('Đặt món thành công! Cảm ơn bạn ❤️'),
              duration: Duration(seconds: 1),
            ),
          );
        },
      ),
    );
  }
}

class MenuCard extends StatelessWidget {
  final String title;
  final int price;
  final String imageName; // 👉 thay vì IconData
  final Color color;

  const MenuCard({
    super.key,
    required this.title,
    required this.price,
    required this.imageName,
    required this.color,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 300,
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: const [
          BoxShadow(color: Colors.grey, blurRadius: 8, offset: Offset(0, 6)),
        ],
      ),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/$imageName',
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(height: 8),
          Text(
            title,
            textAlign: TextAlign.center,
            style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 4),
          Text(
            '$price VNĐ',
            style: const TextStyle(fontSize: 16, color: Colors.grey),
          ),
          const SizedBox(height: 10),
          ElevatedButton.icon(
            style: ElevatedButton.styleFrom(
              backgroundColor: color,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(
                  content: Text('Đã thêm $title vào giỏ hàng'),
                  duration: Duration(seconds: 1),
                ),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text(
              'Thêm món',
              style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
