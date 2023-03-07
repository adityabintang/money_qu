class PaymentMethod {
  final int? id;
  final String? name;
  final String? code;
  final String? thumbnail;
  final String? status;

  PaymentMethod({
    this.id,
    this.name,
    this.code,
    this.thumbnail,
    this.status,
  });

  factory PaymentMethod.fromJson(Map<String, dynamic> json) => PaymentMethod(
    id: json['id'],
    name: json['name'],
    code: json['code'],
    thumbnail: json['thumbnail'],
    status: json['status']
  );
}
