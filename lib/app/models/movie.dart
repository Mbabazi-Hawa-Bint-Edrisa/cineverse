class Movie{
   bool? adult;
   String? backdropPath;
   int? id;
   String? originalLanguage;
   String? originalTitle;
   String? overview;
   double? popularity;
   String? posterPath;
   String? releaseDate;
   String? title;
   bool? video;
   double? voteAverage;
   int? voteCount;

  Movie(
      {this.adult,
      this.backdropPath,
      this.id,
      this.originalLanguage,
      this.originalTitle,
      this.overview,
      this.popularity,
      this.posterPath,
      this.releaseDate,
      this.title,
      this.video,
      this.voteAverage,
      this.voteCount});

  Movie.fromJson(Map<String, dynamic> json) {
        adult= json['adult'];
        backdropPath= json['backdrop_path'];
        id= json['id'];
        originalLanguage= json['original_language'];
        originalTitle= json['original_title'];
        overview= json['overview'];
        popularity= json['popularity'];
        posterPath= json['poster_path'];
        releaseDate= json['release_date'];
        title= json['title'];
        video = json['video'];
        voteAverage = json['vote_average'];
        voteCount = json['vote_count'];
  }

}


// class Movie {
//   final int id;
//   final String title;
//   final String overview;
//   final String? posterPath; // Made nullable to match TMDB data
//   final String? releaseDate; // Added for release date
//   final double? voteAverage; // Added for rating

//   Movie({
//     required this.id,
//     required this.title,
//     required this.overview,
//     this.posterPath, // Optional, can be null
//     this.releaseDate, // Optional, can be null
//     this.voteAverage, // Optional, can be null
//   });

//   factory Movie.fromJson(Map<String, dynamic> json) {
//     return Movie(
//       id: json['id'],
//       title: json['title'] ?? json['name'] ?? 'Untitled', // Fallback for TV shows
//       overview: json['overview'] ?? 'No description available.',
//       posterPath: json['poster_path'], // Null if not present
//       releaseDate: json['release_date'] ?? json['first_air_date'], // Movies or TV
//       voteAverage: (json['vote_average'] as num?)?.toDouble(), // Convert to double, nullable
//     );
//   }

//   get genreIds => null;
// }
// // class Movie {
// //   final int id;
// //   final String title;
// //   final String overview;
// //   final String posterPath;

// //   Movie({
// //     required this.id,
// //     required this.title,
// //     required this.overview,
// //     required this.posterPath,
// //   });

// //   factory Movie.fromJson(Map<String, dynamic> json) {
// //     return Movie(
// //       id: json['id'],
// //       title: json['title'],
// //       overview: json['overview'],
// //       posterPath: json['poster_path'] ?? '', // Default to empty if null
// //     );
// //   }
// // }
