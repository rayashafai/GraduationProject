import 'package:flutter/material.dart';
import 'windowsdetails.dart'; // Import the WindowsDetailPage

class WindowsMirrorPage extends StatelessWidget {
  const WindowsMirrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // List of sample products with names, prices, and images
    final List<Map<String, String>> products = [
      {
        'name': 'Black Window',
        'price': '\$100',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSjQBHfQc8Fp4q8TW9ahyedg0psHHO4QlbdnQ&s', // Replace with actual image URL
      },
      {
        'name': 'Gallery Curtis',
        'price': '\$89.99',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQc2KEHstnc9vU1wV5zaWblRrVoMJoizWzsyQ&s', // Replace with actual image URL
      },
      {
        'name': 'Bridgit classic',
        'price': '\$75.49',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSThnJhZJ_HFhDxuUX4UtN3_XzqinMCUsNIOg&s', // Replace with actual image URL
      },
      {
        'name': 'Fulbrook indoor',
        'price': '\$25.50',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT-zeLjCPltgak6g85xqTggk4F82ATy1wpEWw&s', // Replace with actual image URL
      },
      {
        'name': 'Wiskett Window',
        'price': '\$30',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQtoaxdWjUGTClAc8ggpnZrGAS1aW8K1E52OA&s', // Replace with actual image URL
      },
      {
        'name': 'Reclaimed Wooden',
        'price': '\$49.99',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQIRMuNhUXTQzZw0u0eRmXFZRO15ZT-DNR_Vw&s', // Replace with actual image URL
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Windows Mirror'),
        backgroundColor: Colors.brown[400],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
                'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgpG5mthX6nD0IedvjM69paFE3UtnGK9E74Q&s'),
            fit: BoxFit.cover,
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: ListView.builder(
            itemCount: products.length,
            itemBuilder: (context, index) {
              return Card(
                margin: const EdgeInsets.symmetric(vertical: 10),
                child: ListTile(
                  contentPadding: const EdgeInsets.all(10),
                  leading: Image.network(
                    products[index]['image']!,
                    width: 60,
                    height: 60,
                    fit: BoxFit.cover,
                  ),
                  title: Text(
                    products[index]['name']!,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    products[index]['price']!,
                    style: const TextStyle(fontSize: 16, color: Colors.green),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => WindowsDetailPage(
                            name: products[index]['name']!,
                            price: products[index]['price']!,
                            image: products[index]['image']!,
                          ),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.brown[400],
                    ),
                    child: const Text(
                      'More',
                      style: TextStyle(fontSize: 18, color: Colors.white),
                    ),
                  ),
                ),
              );
            },
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown[400],
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 238, 205, 205),
        currentIndex: 1, // Set to 1 as this page focuses on Products
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(context, '/cart'); // Navigate to Cart page
              break;
            case 2:
              Navigator.pushNamed(context, '/search');
              break;
            case 3:
              Navigator.pushNamed(context, '/profile');
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.shopping_cart), // Updated to shopping cart icon
            label: 'Cart', // Updated label
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
