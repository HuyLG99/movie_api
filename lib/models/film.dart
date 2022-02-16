class TvShows {
  late final int id;
  String? name;
  String? permalink;
  String? startDate;
  String? endDate;
  String? country;
  String? network;
  String? status;
  String? imageThumbnailPath;
  String? description;

  TvShows(
      {required this.id,
      this.name,
      this.permalink,
      this.startDate,
      this.endDate,
      this.country,
      this.network,
      this.status,
      this.imageThumbnailPath,
      this.description});

  TvShows.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'] as String;
    permalink = json['permalink'];
    startDate = json['start_date'];
    endDate = json['end_date'];
    country = json['country'];
    network = json['network'];
    status = json['status'];
    imageThumbnailPath = json['image_thumbnail_path'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    data['permalink'] = permalink;
    data['start_date'] = startDate;
    data['end_date'] = endDate;
    data['country'] = country;
    data['network'] = network;
    data['status'] = status;
    data['image_thumbnail_path'] = imageThumbnailPath;
    data['description'] = description;
    return data;
  }

  static List<TvShows> movieSnapshot(List snapshot) {
    return snapshot.map((data) {
      return TvShows.fromJson(data);
    }).toList();
  }
}
