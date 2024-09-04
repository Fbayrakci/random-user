class UserLocation {
  final String city;
  final String state;
  final String country;
  final String postcode;
  final LocationCordinate coordinates;
  final LocationTimeZoneCoordinate timezone;
  final Street street;

  UserLocation({
    required this.city,
    required this.state,
    required this.country,
    required this.postcode,
    required this.coordinates,
    required this.timezone,
    required this.street,
  });
  factory UserLocation.fromMap(Map<String, dynamic> json) {
    final street = Street.fromMap(json['street']);

    final coordinates = LocationCordinate.fromMap(json['coordinates']);

    final timezone = LocationTimeZoneCoordinate.fromMap(json['timezone']);
    return UserLocation(
        city: json['city'],
        state: json['state'],
        country: json['country'],
        postcode: json['postcode'].toString(),
        coordinates: coordinates,
        timezone: timezone,
        street: street);
  }
}

class Street {
  final int number;
  final String name;

  Street({
    required this.number,
    required this.name,
  });
  factory Street.fromMap(Map<String, dynamic> json) {
    return Street(number: json['number'], name: json['name']);
  }
}

class LocationCordinate {
  final String latitude;
  final String longitude;

  LocationCordinate({required this.latitude, required this.longitude});
  factory LocationCordinate.fromMap(Map<String, dynamic> json) {
    return LocationCordinate(latitude: json['latitude'], longitude: json['longitude']);
  }
}

class LocationTimeZoneCoordinate {
  final String offset;
  final String description;

  LocationTimeZoneCoordinate({
    required this.offset,
    required this.description,
  });
  factory LocationTimeZoneCoordinate.fromMap(Map<String, dynamic> json) {
    return LocationTimeZoneCoordinate(
      description: json['description'],
      offset: json['offset'],
    );
  }
}
