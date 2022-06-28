class Space {
  int id = 0;
  String name = "";
  String imageUrl = "";
  int price = 0;

  String city = "";
  String country = "";
  int rating = 0;
  String? address = "";
  String? phone = "";
  String mapUrl = "";
  List? photos = [];
  int numberOfKitchens = 0;
  int numberOfBedrooms = 0;
  int numberOfCupboards = 0;

  Space(
      {required this.city,
      required this.country,
      required this.id,
      required this.imageUrl,
      required this.price,
      required this.rating,
      required this.name,
      this.address,
      required this.mapUrl,
      this.phone,
      required this.numberOfKitchens,
      required this.numberOfBedrooms,
      required this.numberOfCupboards,
      this.photos});

  Space.fromJson(json) {
    id = json['id'];
    name = json['name'];
    city = json['city'];
    country = json["country"];
    imageUrl = json['image_url'];
    price = json['price'];
    rating = json['rating'];
    address = json['address'];
    phone = json['phone'];
    photos = json['photos'];
    mapUrl = json['map_url'];
    numberOfBedrooms = json['number_of_bedrooms'];
    numberOfCupboards = json['number_of_cupboards'];
    numberOfKitchens = json['number_of_kitchens'];
  }
}
