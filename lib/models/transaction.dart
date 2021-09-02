class TransactionModel {
  int? id;
  String? category;
  int? amount;
  String? date;
  String? type;
  String? description;

  get getId => this.id;

  set setId(id) => this.id = id;

  get cateogryid => this.category;

  set cateogryid(value) => this.category = value;

  get getAmount => this.amount;

  set setAmount(amount) => this.amount = amount;

  get getDate => this.date;

  set setDate(date) => this.date = date;

  get getType => this.type;

  set setType(type) => this.type = type;

  get getDescription => this.description;

  set setDescription(description) => this.description = description;

  TransactionModel();
  TransactionModel.withoutId(
      this.category, this.amount, this.date, this.type, this.description);
  TransactionModel.withId(this.id, this.category, this.amount, this.date,
      this.type, this.description);

  Map<String, dynamic> toMap() => {
        'id': id,
        'category_id': category,
        'date': date,
        'type': type,
        'description': description,
        'amount': amount
      };

  TransactionModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    amount = map['amount'];
    category = map['category_id'];
    date = map['date'];
    type = map['type'];
    description = map['description'];
  }
}
