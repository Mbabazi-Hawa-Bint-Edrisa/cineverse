class Casting{
  String? originalName;
  String? profilePath;
  String? character;

  Casting({this.originalName, this.profilePath, this.character});

  Casting.fromJson(Map<String, dynamic> json) {
    originalName= json['original_name'];
    profilePath= json['profile_path'];
    character= json['character'];
  }

}

