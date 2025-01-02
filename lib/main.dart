//import 'package:firstt/whitemirror.dart';
import 'package:flutter/material.dart';
import 'welcome.dart'; // Import WelcomePage
import 'signin.dart'; // Import SignInPage
import 'signup.dart'; // Import SignUpPage
import 'home.dart'; // Import HomePage
import 'whitemirror.dart'; // Import WhiteMirrorPage
import 'windowsmirror.dart'; // Import WhiteMirrorPage
import 'detailspage.dart'; // Import ProductDetailPage
import 'profile.dart'; // Import ProfilePage
import 'editprofile.dart'; // Import EditProfilePage
import 'adminlogin.dart'; // Import AdminLoginPage
import 'admin.dart'; // Import AdminPage
import 'cart.dart';
//import 'managecontent.dart'; //Import ManageContentPage

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.brown,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      initialRoute: '/', // Set initial route to WelcomePage
      onGenerateRoute: (RouteSettings settings) {
        // Handle routes dynamically
        switch (settings.name) {
          case '/':
            return MaterialPageRoute(builder: (context) => const WelcomePage());
          case '/signin':
            return MaterialPageRoute(builder: (context) => const SignInPage());
          case '/signup':
            return MaterialPageRoute(builder: (context) => const SignUpPage());
          case '/home':
            return MaterialPageRoute(builder: (context) => const HomePage());
          case '/whitemirror':
            return MaterialPageRoute(
                builder: (context) => const WhiteMirrorPage());
          case '/windowsmirror':
            return MaterialPageRoute(
                builder: (context) => const WindowsMirrorPage());
          case '/cart':
            return MaterialPageRoute(builder: (context) => CartPage());
          case '/detailspage':
            // Extract arguments passed to the route
            final args = settings.arguments as Map<String, String>;
            return MaterialPageRoute(
              builder: (context) => ProductDetailPage(
                name: args['name']!,
                price: args['price']!,
                image: args['image']!,
              ),
            );
          case '/profile':
            return MaterialPageRoute(builder: (context) => const ProfilePage());
          case '/editProfile':
            return MaterialPageRoute(
                builder: (context) => const EditProfilePage());
          case '/adminlogin':
            return MaterialPageRoute(
                builder: (context) => const AdminLoginPage());
          case '/admin':
            return MaterialPageRoute(builder: (context) => const AdminPage());
          //  case '/managecontent':
          // return MaterialPageRoute(
          //   builder: (context) => const ManageContentPage());
          default:
            return MaterialPageRoute(builder: (context) => const WelcomePage());
        }
      },
    );
  }
}
