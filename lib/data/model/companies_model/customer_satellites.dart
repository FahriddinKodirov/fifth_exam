class CustomerSatellites {
  String id;
  String country;
  String launchDate;
  String mass;
  String launcher;
  
  CustomerSatellites(
      {required this.id,
      required this.country,
      required this.launchDate,
      required this.mass,
      required this.launcher});

  factory CustomerSatellites.fromJson(Map<String, dynamic> jsonData) {
    return CustomerSatellites(
        id: jsonData['id'] ?? '',
        country: jsonData['country'] ?? '',
        launchDate: jsonData['launch_date'] ?? '',
        mass: jsonData['mass'] ?? '',
        launcher: jsonData['launcher'] ?? ''
    );
  }
}
