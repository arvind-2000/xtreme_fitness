class Admission {
  int id;
  String name;
  double price;
  double discountPercentage;

  // Constructor with named parameters
  Admission({
    required this.id,
    required this.name,
    required this.price,
    required this.discountPercentage,
  });

  // Factory constructor to create an instance from JSON
  factory Admission.fromJson(Map<String, dynamic> json) {
    return Admission(
      id: json['Id'],
      name: json['Name'],
      price: (json['Price']??0).toDouble(), // Convert to double
      discountPercentage: (json['DiscountPercentage']??0).toDouble(), // Convert to double
    );
  }

  // Method to convert the instance back to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'price': price,
      'discountPercentage': discountPercentage,
    };
  }
}
