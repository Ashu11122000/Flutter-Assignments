class Contact {
  final String id;
  final String name;
  final String phone;
  final String email;
  bool isFavorite;

  Contact({
    required this.id,
    required this.name,
    required this.phone,
    required this.email,
    this.isFavorite = false,
  });
}