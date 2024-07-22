class Collection {
  String id;
  String title;
  String subtitle;
  String? description;
  String imageUrl;
  Collection({
    required this.id,
    required this.title,
    required this.subtitle,
    this.description,
    required this.imageUrl,
  });
}
