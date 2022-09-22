import 'dart:convert';

List<Food> foodListFromMap(String str) =>
    List<Food>.from(json.decode(str).map((x) => Food.fromMap(x)));

class Food {
  Food({
    required this.img,
    required this.name,
    required this.dsc,
    required this.price,
    required this.rate,
    required this.country,
  });

  String img;
  String name;
  String dsc;
  double price;
  int rate;
  String country;

  factory Food.fromMap(Map<String, dynamic> json) => Food(
        img: json['img'] ??
            'https://goldbelly.imgix.net/uploads/showcase_media_asset/image/134862/shake-shack-shackburger-8-pack.973a5e26836ea86d7e86a327becea2b0.png?ixlib=react-9.0.2&auto=format&ar=1%3A1',
        name: json['name'] ?? 'Shake Shack',
        dsc: json['dsc'] ?? 'Shake Shack ShackBurger® – 8 Pack',
        price: json['price']?.toDouble() ?? 99.99,
        rate: json['rate'] ?? 5,
        country: json['country'] ?? 'New York, NY',
      );
}
