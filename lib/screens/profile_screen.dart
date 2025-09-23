import 'package:flutter/material.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  bool _isEditing = false;

  // Controllers to manage the text in TextFormFields
  late final TextEditingController _nameController;
  late final TextEditingController _emailController;
  late final TextEditingController _phoneController;
  late final TextEditingController _societyNumberController;

  @override
  void initState() {
    super.initState();
    // Initialize controllers with dummy data
    _nameController = TextEditingController(text: 'John Doe');
    _emailController = TextEditingController(text: 'john.doe@example.com');
    _phoneController = TextEditingController(text: '+1 234 567 890');
    _societyNumberController = TextEditingController(text: 'A-12345');
  }

  @override
  void dispose() {
    // Dispose controllers when the widget is removed from the tree
    _nameController.dispose();
    _emailController.dispose();
    _phoneController.dispose();
    _societyNumberController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(24.0),
      children: [
        const Center(
          child: CircleAvatar(
            radius: 50,
            backgroundColor: Colors.black12,
            child: Icon(Icons.person, size: 60, color: Colors.white),
          ),
        ),
        const SizedBox(height: 24),
        TextFormField(
          controller: _societyNumberController,
          readOnly: true, // Society number is always read-only
          decoration: const InputDecoration(
            labelText: 'Society Number',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.shield_outlined),
            filled: true,
            fillColor: Colors.black12,
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _nameController,
          readOnly: !_isEditing,
          decoration: const InputDecoration(
            labelText: 'Full Name',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.person_outline),
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _emailController,
          readOnly: !_isEditing,
          decoration: const InputDecoration(
            labelText: 'Email Address',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.email_outlined),
          ),
        ),
        const SizedBox(height: 16),
        TextFormField(
          controller: _phoneController,
          readOnly: !_isEditing,
          decoration: const InputDecoration(
            labelText: 'Phone Number',
            border: OutlineInputBorder(),
            prefixIcon: Icon(Icons.phone_outlined),
          ),
        ),
        const SizedBox(height: 32),
        SizedBox(
          width: double.infinity, // Make button take full width
          child: ElevatedButton(
            onPressed: () {
              setState(() {
                if (_isEditing) {
                  // Here you would add logic to save the data
                  // For now, we just exit the editing mode
                  _isEditing = false;
                } else {
                  // Enter editing mode
                  _isEditing = true;
                }
              });
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: _isEditing
                  ? Colors.green
                  : Theme.of(context).primaryColor,
              foregroundColor: Colors.white, // Sets the text color
              padding: const EdgeInsets.symmetric(vertical: 16),
            ),
            child: Text(_isEditing ? 'Save Changes' : 'Edit Profile'),
          ),
        ),
      ],
    );
  }
}
