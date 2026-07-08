class Movie {
  final int id;
  final String title;
  final String summary;
  final String imageUrl;
  final double rating;

  Movie({
    required this.id,
    required this.title,
    required this.summary,
    required this.imageUrl,
    required this.rating,
  });

  // Factory constructor with data validation and null-safety safeguards
  factory Movie.fromJson(Map<String, dynamic> json) {
    final show = json['show'] ?? {};
    final imageMap = show['image'] as Map<String, dynamic>?;
    final ratingMap = show['rating'] as Map<String, dynamic>?;

    // Remove HTML tags from the summary if present
    String cleanSummary = show['summary'] ?? 'No summary available.';
    cleanSummary = cleanSummary.replaceAll(RegExp(r'<[^>]*>'), '');

    return Movie(
      id: show['id'] ?? 0,
      title: show['name'] ?? 'Unknown Title',
      summary: cleanSummary,
      imageUrl: imageMap?['medium'] ?? 'https://via.placeholder.com/150',
      rating: (ratingMap?['average'] ?? 0.0).toDouble(),
    );
  }
}