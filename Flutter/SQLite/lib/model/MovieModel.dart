class MovieModel {
  final String id;
  final String title;
  final String language;
  final int year;
  MovieModel({
    required this.id,
    required this.title,
    required this.language,
    required this.year,
  });
  factory MovieModel.fromJson(Map<String, dynamic> data) => MovieModel(
        id: data['id'],
        title: data['title'],
        language: data['language'],
        year: data['year'],
      );
  Map<String, dynamic> toMap() =>
      {'id': id, 'title': title, 'language': language, 'year': year};
}
