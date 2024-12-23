import 'package:flutter/material.dart';

class ManageUsersPage extends StatelessWidget {
  const ManageUsersPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Sample user data
    final List<Map<String, String>> users = [
      {'name': 'John Doe', 'email': 'john.doe@example.com'},
      {'name': 'Jane Smith', 'email': 'jane.smith@example.com'},
      {'name': 'Alice Brown', 'email': 'alice.brown@example.com'},
      {'name': 'Bob Johnson', 'email': 'bob.johnson@example.com'},
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Manage Users'),
        backgroundColor: Colors.brown[400],
      ),
      body: Container(
        decoration: BoxDecoration(
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
            itemCount: users.length,
            itemBuilder: (context, index) {
              final user = users[index];
              return Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12),
                ),
                elevation: 4,
                margin: const EdgeInsets.only(bottom: 16),
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.brown[200],
                    child: const Icon(Icons.person, color: Colors.white),
                  ),
                  title: Text(
                    user['name']!,
                    style: const TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  subtitle: Text(user['email']!),
                  trailing: PopupMenuButton<String>(
                    onSelected: (value) {
                      if (value == 'View') {
                        _viewUser(context, user['name']!, user['email']!);
                      } else if (value == 'Edit') {
                        _editUser(context, user['name']!);
                      } else if (value == 'Delete') {
                        _deleteUser(context, user['name']!);
                      }
                    },
                    itemBuilder: (context) => [
                      const PopupMenuItem(value: 'View', child: Text('View')),
                      const PopupMenuItem(value: 'Edit', child: Text('Edit')),
                      const PopupMenuItem(
                          value: 'Delete', child: Text('Delete')),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }

  void _viewUser(BuildContext context, String name, String email) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('User Details'),
        content: Text('Name: $name\nEmail: $email'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
        ],
      ),
    );
  }

  void _editUser(BuildContext context, String name) {
    // Navigate to edit user page (to be implemented later)
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Edit user: $name (Feature coming soon!)')),
    );
  }

  void _deleteUser(BuildContext context, String name) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text('Delete User'),
        content: Text('Are you sure you want to delete $name?'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Cancel'),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('User $name has been deleted.')),
              );
            },
            child: const Text('Delete', style: TextStyle(color: Colors.red)),
          ),
        ],
      ),
    );
  }
}
