import 'package:flutter/material.dart';
import 'detailspage.dart'; // Import the product detail page

class WhiteMirrorPage extends StatelessWidget {
  const WhiteMirrorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<Map<String, String>> products = [
      {
        'name': 'Ariana Mirrors',
        'price': '\$10.9',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQaY3K6djcWZAtgxKUlwmUKTPpLCU83jPgb1w&s', // Replace with actual image URL
      },
      {
        'name': 'Arched Natural Wood',
        'price': '\$19.99',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSr-8mqWjGtCKn_ZEfBSOjxetJUpVsH5Oz9cg&s', // Replace with actual image URL
      },
      {
        'name': 'Capsule Standing',
        'price': '\$5.49',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTUMh5wJM2DnEsXWEHFr_yVcGNDn4ceRrbqAw&s', // Replace with actual image URL
      },
      {
        'name': 'Capsule Standing',
        'price': '\$5.49',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSXjtl5UBCR8rOGjNTDmeNf2CJtx8If0Ahw7A&s', // Replace with actual image URL
      },
      {
        'name': 'Capsule Standing',
        'price': '\$5.49',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQO0vFKX7bjE_PwJPXzKOmyZ7OfgJ3h_9RlxQ&s', // Replace with actual image URL
      },
      {
        'name': 'Capsule Standing',
        'price': '\$5.49',
        'image':
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ17A3Q7LE90umaUxrtJZEWnh8GT7kdj1hBXQ&s', // Replace with actual image URL
      },
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('White Mirrors'),
        backgroundColor: Colors.brown[400],
      ),
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: NetworkImage(
              'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgpG5mthX6nD0IedvjM69paFE3UtnGK9E74Q&s',
            ),
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
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  subtitle: Text(
                    products[index]['price']!,
                    style: const TextStyle(
                      fontSize: 16,
                      color: Colors.green,
                    ),
                  ),
                  trailing: ElevatedButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => ProductDetailPage(
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
                      style: TextStyle(fontSize: 16, color: Colors.white),
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
        currentIndex: 1, // Reflects the View Products page
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home');
              break;
            case 1:
              Navigator.pushNamed(
                  context, '/cart'); // Navigate to the cart page
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
            icon: Icon(Icons.shopping_cart), // Changed to shopping cart
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
