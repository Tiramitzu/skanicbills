class Invoice {
  Invoice({
    required this.name,
    required this.paid,
    required this.total,
  });

  late String name;
  late int paid, total;
}
