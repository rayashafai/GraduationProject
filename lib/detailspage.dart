import 'package:flutter/material.dart';

class ProductDetailPage extends StatelessWidget {
  final String name;
  final String price;
  final String image;

  // Constructor to accept product data
  const ProductDetailPage({
    Key? key,
    required this.name,
    required this.price,
    required this.image,
  }) : super(key: key);

  void _onNavBarTap(BuildContext context, int index) {
    switch (index) {
      case 0:
        Navigator.pushNamed(context, '/home'); // Navigate to Home
        break;
      case 1:
        Navigator.pushNamed(context, '/viewproduct'); // Navigate to Products
        break;
      case 2:
        Navigator.pushNamed(context, '/search'); // Navigate to Search
        break;
      case 3:
        Navigator.pushNamed(context, '/profile'); // Navigate to Favorites
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(name),
        backgroundColor: Colors.brown[400],
      ),
      body: Container(
        width: double.infinity, // Ensure the container takes full width
        height: double.infinity, // Ensure the container takes full height
        decoration: BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgpG5mthX6nD0IedvjM69paFE3UtnGK9E74Q&s'),
            fit: BoxFit.cover, // Ensures the image covers the entire background
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            mainAxisAlignment:
                MainAxisAlignment.center, // Center the content vertically
            crossAxisAlignment:
                CrossAxisAlignment.center, // Center the content horizontally
            children: [
              // Product Image with border radius
              ClipRRect(
                borderRadius: BorderRadius.circular(20), // Add border radius
                child: Image.network(
                  image,
                  width: 300, // Larger size for the image
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 100),
              // Product Name
              Text(
                name,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Color.fromARGB(255, 148, 116, 104),
                ),
              ),
              const SizedBox(height: 10),
              // Product Price
              Text(
                price,
                textAlign: TextAlign.center,
                style: const TextStyle(
                  fontSize: 20,
                  color: Colors.green,
                ),
              ),
              const SizedBox(height: 30),
              // Add to Cart Button
              ElevatedButton(
                onPressed: () {
                  // Implement add to cart functionality
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Product added to cart')),
                  );
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.brown[400],
                ),
                child: const Text(
                  'Add to Cart',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown[400], // Set background color
        selectedItemColor: Colors.white, // Set selected item color
        unselectedItemColor: const Color.fromARGB(
            255, 238, 205, 205), // Unselected items remain grey
        currentIndex: 1, // Set to 1 as this corresponds to View Products
        onTap: (index) => _onNavBarTap(context, index),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.category),
            label: 'Categories',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search),
            label: 'Search',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: 'Profile',
          ),
        ],
      ),
    );
  }
}
