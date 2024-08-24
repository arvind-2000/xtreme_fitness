class Plan {
  int id;
  String name;
  double price;
  int durationInMonths;
  double discountPercentage;
  String category;

  Plan({
    required this.id,
    required this.name,
    required this.price,
    required this.durationInMonths,
    required this.discountPercentage,
    required this.category,
  });

  // Convert a Plan instance to a Map
  Map<String, dynamic> toJson() {
    return {
      'Id': id,
      'Name': name,
      'Price': price,
      'DurationInMonths': durationInMonths,
      'DiscountPercentage': discountPercentage,
      'Category': category,
    };
  }

  // Create a Plan instance from a Map
  factory Plan.fromJson(Map<String, dynamic> json) {
    return Plan(
      id: json['Id'],
      name: json['Name'],
      price: json['Price'],
      durationInMonths: json['DurationInMonths'],
      discountPercentage: json['DiscountPercentage'],
      category: json['Category'],
    );
  }
}