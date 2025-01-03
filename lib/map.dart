import 'package:flutter/material.dart';

class MapPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Delivery Tracking",
          style: TextStyle(color: Colors.black),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Map Background
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://via.placeholder.com/1024x768', // Replace with actual map image or Google Maps integration
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Route Line and Vehicle Icon
          Positioned(
            top: 100,
            left: 50,
            child: CustomPaint(
              painter: RoutePainter(),
              child: SizedBox(
                width: 300,
                height: 500,
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Icon(
                    Icons.local_taxi,
                    color: Colors.yellow,
                    size: 40,
                  ),
                ),
              ),
            ),
          ),

          // Destination Marker
          Positioned(
            top: 200,
            right: 20,
            child: Icon(
              Icons.location_on,
              color: Colors.red,
              size: 40,
            ),
          ),

          // Delivery Details Section
          Align(
            alignment: Alignment.bottomCenter,
            child: Container(
              padding: EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                ),
              ),
              child: Row(
                children: [
                  // Driver's Image
                  ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.network(
                      'https://via.placeholder.com/80', // Replace with driver's photo
                      width: 80,
                      height: 80,
                      fit: BoxFit.cover,
                    ),
                  ),
                  SizedBox(width: 10),
                  // Driver Info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Michael Carter",
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                        Text("ID: #84WE285788"),
                        Text("Food delivery boy"),
                      ],
                    ),
                  ),
                  // Call Button
                  IconButton(
                    icon: Icon(Icons.call, color: Colors.green),
                    onPressed: () {
                      // Add call functionality
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

// Painter for drawing the route line
class RoutePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Colors.green
      ..strokeWidth = 4
      ..style = PaintingStyle.stroke;

    // Draw a curved route
    final path = Path()
      ..moveTo(50, 400)
      ..quadraticBezierTo(150, 200, 250, 300)
      ..lineTo(300, 200);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return false;
  }
}
