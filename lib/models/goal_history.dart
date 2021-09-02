class GoalHistoryModel {
  int? id;
  int? save_id;
  String? date;
  int? amount;

  set setId(id) => this.id = id;

  get saveid => this.save_id;

  set saveid(value) => this.save_id = value;

  get getDate => this.date;

  set setDate(date) => this.date = date;

  get getAmount => this.amount;

  set setAmount(amount) => this.amount = amount;

  GoalHistoryModel();
  GoalHistoryModel.withId(this.id, this.save_id, this.amount, this.date);
  GoalHistoryModel.withOutId(this.save_id, this.amount, this.date);

  Map<String, dynamic> toMap() =>
      {'id': id, 'save_id': save_id, 'date': date, 'amount': amount};

  GoalHistoryModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    save_id = map['save_id'];
    date = map['date'];
    amount = map['amount'];
  }
}
