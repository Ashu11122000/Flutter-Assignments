import 'package:flutter/material.dart';
import '../models/contact.dart';

class ContactListScreen extends StatefulWidget {
  const ContactListScreen({Key? key}) : super(key: key);

  @override
  _ContactListScreenState createState() => _ContactListScreenState();
}

class _ContactListScreenState extends State<ContactListScreen> {
  // 1. The "Database" (In-memory list with some dummy data)
  final List<Contact> _allContacts = [
    Contact(id: '1', name: 'Alice Smith', phone: '555-0101', email: 'alice@example.com', isFavorite: true),
    Contact(id: '2', name: 'Bob Jones', phone: '555-0102', email: 'bob@example.com'),
    Contact(id: '3', name: 'Charlie Brown', phone: '555-0103', email: 'charlie@example.com'),
    Contact(id: '4', name: 'Diana Prince', phone: '555-0104', email: 'diana@example.com', isFavorite: true),
  ];

  // 2. State variables for UI
  List<Contact> _displayedContacts = [];
  final TextEditingController _searchController = TextEditingController();
  bool _showOnlyFavorites = false;

  @override
  void initState() {
    super.initState();
    // Initially display all contacts
    _displayedContacts = List.from(_allContacts);
  }

  // 3. Search & Filter Logic
  void _runFilter() {
    String searchQuery = _searchController.text.toLowerCase();
    
    setState(() {
      _displayedContacts = _allContacts.where((contact) {
        // Filter by text search (name or phone)
        final matchesSearch = contact.name.toLowerCase().contains(searchQuery) ||
                              contact.phone.contains(searchQuery);
        // Filter by favorite status
        final matchesFavorite = _showOnlyFavorites ? contact.isFavorite : true;
        
        return matchesSearch && matchesFavorite;
      }).toList();
    });
  }

  void _toggleFavoriteStatus(Contact contact) {
    setState(() {
      contact.isFavorite = !contact.isFavorite;
      _runFilter(); // Re-run filter in case we are in "Favorites Only" view
    });
  }

  // 4. Add Contact Logic
  void _showAddContactDialog() {
    final nameController = TextEditingController();
    final phoneController = TextEditingController();
    final emailController = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: const Text('Add New Contact'),
          content: SingleChildScrollView(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: nameController,
                  decoration: const InputDecoration(labelText: 'Name'),
                ),
                TextField(
                  controller: phoneController,
                  decoration: const InputDecoration(labelText: 'Phone'),
                  keyboardType: TextInputType.phone,
                ),
                TextField(
                  controller: emailController,
                  decoration: const InputDecoration(labelText: 'Email'),
                  keyboardType: TextInputType.emailAddress,
                ),
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () => Navigator.pop(context),
              child: const Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                if (nameController.text.isNotEmpty && phoneController.text.isNotEmpty) {
                  setState(() {
                    _allContacts.add(
                      Contact(
                        id: DateTime.now().toString(),
                        name: nameController.text.trim(),
                        phone: phoneController.text.trim(),
                        email: emailController.text.trim(),
                      ),
                    );
                    _runFilter(); // Update the displayed list
                  });
                  Navigator.pop(context);
                }
              },
              child: const Text('Save'),
            ),
          ],
        );
      },
    );
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Contacts'),
        elevation: 0,
        actions: [
          // Filter Toggle Button
          IconButton(
            icon: Icon(_showOnlyFavorites ? Icons.star : Icons.star_border),
            tooltip: 'Filter Favorites',
            onPressed: () {
              setState(() {
                _showOnlyFavorites = !_showOnlyFavorites;
                _runFilter();
              });
            },
          ),
        ],
      ),
      // Web/Desktop layout safeguards
      body: Center(
        child: ConstrainedBox(
          constraints: const BoxConstraints(maxWidth: 600),
          child: Column(
            children: [
              // Search Bar
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: TextField(
                  controller: _searchController,
                  onChanged: (value) => _runFilter(),
                  decoration: InputDecoration(
                    hintText: 'Search by name or phone...',
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: _searchController.text.isNotEmpty
                        ? IconButton(
                            icon: const Icon(Icons.clear),
                            onPressed: () {
                              _searchController.clear();
                              _runFilter();
                            },
                          )
                        : null,
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                ),
              ),
              
              // Contact List
              Expanded(
                child: _displayedContacts.isEmpty
                    ? const Center(
                        child: Text(
                          'No contacts found.',
                          style: TextStyle(fontSize: 18, color: Colors.grey),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _displayedContacts.length,
                        itemBuilder: (context, index) {
                          final contact = _displayedContacts[index];
                          return Card(
                            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
                            child: ListTile(
                              leading: CircleAvatar(
                                backgroundColor: Colors.indigo.shade100,
                                child: Text(
                                  contact.name.isNotEmpty ? contact.name[0].toUpperCase() : '?',
                                  style: TextStyle(
                                    color: Colors.indigo.shade900,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              title: Text(contact.name, style: const TextStyle(fontWeight: FontWeight.bold)),
                              subtitle: Text('${contact.phone}\n${contact.email}'),
                              isThreeLine: true,
                              trailing: IconButton(
                                icon: Icon(
                                  contact.isFavorite ? Icons.star : Icons.star_border,
                                  color: contact.isFavorite ? Colors.amber : Colors.grey,
                                ),
                                onPressed: () => _toggleFavoriteStatus(contact),
                              ),
                            ),
                          );
                        },
                      ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _showAddContactDialog,
        child: const Icon(Icons.person_add),
      ),
    );
  }
}