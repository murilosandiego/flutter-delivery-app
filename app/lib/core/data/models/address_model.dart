class AddressModel {
  AddressModel({
    this.id,
    this.place,
    this.number,
    this.district,
    this.latitude,
    this.longitude,
    this.adressDefault,
    this.zipCode,
    this.state,
    this.city,
    this.complement,
    this.name,
  });

  final int id;
  final String place;
  final String number;
  final String district;
  final dynamic latitude;
  final dynamic longitude;
  final bool adressDefault;
  final String zipCode;
  final String state;
  final String city;
  final dynamic complement;
  final String name;

  AddressModel copyWith({
    int id,
    String place,
    String number,
    String district,
    dynamic latitude,
    dynamic longitude,
    bool adressDefault,
    String zipCode,
    String state,
    String city,
    dynamic complement,
    String name,
  }) =>
      AddressModel(
        id: id ?? this.id,
        place: place ?? this.place,
        number: number ?? this.number,
        district: district ?? this.district,
        latitude: latitude ?? this.latitude,
        longitude: longitude ?? this.longitude,
        adressDefault: adressDefault ?? this.adressDefault,
        zipCode: zipCode ?? this.zipCode,
        state: state ?? this.state,
        city: city ?? this.city,
        complement: complement ?? this.complement,
        name: name ?? this.name,
      );

  factory AddressModel.fromMap(Map<String, dynamic> json) => AddressModel(
        id: json["id"] == null ? null : json["id"],
        place: json["place"] == null ? null : json["place"],
        number: json["number"] == null ? null : json["number"],
        district: json["district"] == null ? null : json["district"],
        latitude: json["latitude"],
        longitude: json["longitude"],
        adressDefault: json["default"] == null ? null : json["default"],
        zipCode: json["zip_code"] == null ? null : json["zip_code"],
        state: json["state"] == null ? null : json["state"],
        city: json["city"] == null ? null : json["city"],
        complement: json["complement"],
        name: json["name"] == null ? null : json["name"],
      );

  Map<String, dynamic> toMap() => {
        "id": id == null ? null : id,
        "place": place == null ? null : place,
        "number": number == null ? null : number,
        "district": district == null ? null : district,
        "latitude": latitude,
        "longitude": longitude,
        "default": adressDefault == null ? null : adressDefault,
        "zip_code": zipCode == null ? null : zipCode,
        "state": state == null ? null : state,
        "city": city == null ? null : city,
        "complement": complement,
        "name": name == null ? null : name,
      }..removeWhere((key, value) => key == 'id' && value == null);

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AddressModel &&
        o.id == id &&
        o.place == place &&
        o.number == number &&
        o.district == district &&
        o.latitude == latitude &&
        o.longitude == longitude &&
        o.adressDefault == adressDefault &&
        o.zipCode == zipCode &&
        o.state == state &&
        o.city == city &&
        o.complement == complement &&
        o.name == name;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        place.hashCode ^
        number.hashCode ^
        district.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        adressDefault.hashCode ^
        zipCode.hashCode ^
        state.hashCode ^
        city.hashCode ^
        complement.hashCode ^
        name.hashCode;
  }

  @override
  String toString() {
    return 'AddressModel(id: $id, place: $place, number: $number, district: $district, latitude: $latitude, longitude: $longitude, adressDefault: $adressDefault, zipCode: $zipCode, state: $state, city: $city, complement: $complement, name: $name)';
  }
}
