class Transaction {
  final String time, name, phone, amount, category;
  final String reference;
  final bool isSuccessful, isMoMo, isFavorite;

  Transaction(
      {required this.time,
      required this.name,
      required this.phone,
      required this.amount,
      required this.category,
      required this.reference,
      required this.isSuccessful,
      required this.isMoMo,
      required this.isFavorite});
}
