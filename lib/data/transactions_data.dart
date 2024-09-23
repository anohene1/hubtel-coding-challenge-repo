import 'package:hubtel/model/Transactions.dart';
import 'package:hubtel/model/transaction.dart';

List<Transactions> transactionsData = [
  Transactions(
    transactions: [
      Transaction(
        time: "12:45 PM",
        name: "Emmanuel Rockson Kwabena Uncle Ebo",
        phone: "0241234567",
        isMoMo: true,
        isSuccessful: true,
        reference: "Cool your heart wai",
        amount: "GHS 500",
        isFavorite: true,
        category: "Personal",
      ),
      Transaction(
        time: "12:45 PM",
        name: "Absa Bank",
        phone: "0241234567",
        isMoMo: false,
        isSuccessful: false,
        reference: "Cool your heart wai",
        amount: "GHS 500",
        isFavorite: true,
        category: "Personal",
      ),
    ],
    date: "May 24, 2022",
  ),
  Transactions(
    transactions: [
      Transaction(
        time: "12:45 PM",
        name: "Emmanuel Rockson",
        phone: "0241234567",
        isMoMo: true,
        isSuccessful: true,
        reference: "Cool your heart wai",
        amount: "GHS 500",
        isFavorite: false,
        category: "Personal",
      ),
      Transaction(
        time: "12:45 PM",
        name: "Absa Bank",
        phone: "0241234567",
        isMoMo: false,
        isSuccessful: false,
        reference: "Cool your heart wai",
        amount: "GHS 500",
        isFavorite: true,
        category: "Other",
      ),
    ],
    date: "May 23, 2022",
  ),
];
