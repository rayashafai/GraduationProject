import 'package:flutter/material.dart';
import 'map.dart';

class BookingPage extends StatefulWidget {
  @override
  _BookingPageState createState() => _BookingPageState();
}

class _BookingPageState extends State<BookingPage> {
  DateTime? selectedStartDate;
  DateTime? selectedEndDate;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Booking Your Date"),
        backgroundColor: Colors.brown[400],
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications),
            onPressed: () {
              // Notification logic
            },
          ),
        ],
      ),
      extendBodyBehindAppBar: true, // Extend the body behind the AppBar
      body: Stack(
        children: [
          // Background Image
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcSgpG5mthX6nD0IedvjM69paFE3UtnGK9E74Q&s',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Foreground content
          SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 100), // Space below the AppBar
                  // Destination card
                  Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    child: ListTile(
                      leading: ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          'https://via.placeholder.com/80', // Replace with your image URL
                          fit: BoxFit.cover,
                        ),
                      ),
                      title: Text("Cox's Bazar"),
                      subtitle: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Bangladesh"),
                          Row(
                            children: [
                              Text("\$450 "),
                              Text("3 Days",
                                  style: TextStyle(color: Colors.grey)),
                            ],
                          ),
                          Row(
                            children: [
                              Icon(Icons.star, color: Colors.orange, size: 16),
                              Text("4.9 (2k Reviews)"),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),

                  SizedBox(height: 20),

                  // From and To section
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      _locationInfo("From", "New York"),
                      _locationInfo("To", "Cox's Bazar"),
                    ],
                  ),

                  SizedBox(height: 20),

                  // Booking dates
                  Text(
                    "Booking Your Date",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      color: Colors.brown[400],
                    ),
                  ),
                  SizedBox(height: 10),
                  _buildDatePicker(),

                  SizedBox(height: 20),

                  // Continue button
                  Center(
                    child: ElevatedButton(
                      onPressed: () {
                        if (selectedStartDate != null &&
                            selectedEndDate != null) {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => MapPage(
                                  // startDate: selectedStartDate,
                                  // endDate: selectedEndDate,
                                  ),
                            ),
                          );
                        } else {
                          // Show a message if dates are not selected
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(
                              content: Text(
                                  "Please select both start and end dates!"),
                            ),
                          );
                        }
                      },
                      style: ElevatedButton.styleFrom(
                        padding:
                            EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                        backgroundColor: Colors.brown[400],
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: Text(
                        "Continue",
                        style: TextStyle(fontSize: 18, color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
      // Bottom Navigation Bar
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.brown[400],
        selectedItemColor: Colors.white,
        unselectedItemColor: const Color.fromARGB(255, 238, 205, 205),
        currentIndex: 1, // Set to 1 as this page is focused on Booking
        onTap: (index) {
          switch (index) {
            case 0:
              Navigator.pushNamed(context, '/home'); // Navigate to Home
              break;
            case 1:
              // Stay on BookingPage
              break;
            case 2:
              Navigator.pushNamed(context, '/search'); // Navigate to Search
              break;
            case 3:
              Navigator.pushNamed(context, '/profile'); // Navigate to Profile
              break;
          }
        },
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today),
            label: 'Booking',
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

  Widget _locationInfo(String label, String location) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(fontSize: 14, color: Colors.brown[400]),
        ),
        SizedBox(height: 5),
        Text(
          location,
          style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color: Colors.brown[400]),
        ),
      ],
    );
  }

  Widget _buildDatePicker() {
    return Column(
      children: [
        // Calendar widget for selecting dates
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            _datePickerButton("Start Date", selectedStartDate, (pickedDate) {
              setState(() {
                selectedStartDate = pickedDate;
              });
            }),
            _datePickerButton("End Date", selectedEndDate, (pickedDate) {
              setState(() {
                selectedEndDate = pickedDate;
              });
            }),
          ],
        ),
        SizedBox(height: 10),
      ],
    );
  }

  Widget _datePickerButton(
      String label, DateTime? date, Function(DateTime) onDatePicked) {
    return ElevatedButton(
      onPressed: () async {
        final pickedDate = await showDatePicker(
          context: context,
          initialDate: date ?? DateTime.now(),
          firstDate: DateTime(2021),
          lastDate: DateTime(2030),
        );
        if (pickedDate != null) {
          onDatePicked(pickedDate);
        }
      },
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        side: BorderSide(color: Colors.grey),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(8),
        ),
      ),
      child: Text(
        date != null ? "${date.day}/${date.month}/${date.year}" : label,
        style: TextStyle(color: Colors.black),
      ),
    );
  }
}
