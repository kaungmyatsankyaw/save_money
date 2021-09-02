class GoalModel {
  int? id;
  String? category_id;
  String? start_date;
  String? end_date;
  int? current_amount;
  int? save_amount;
  int? achieve;

  get getId => this.id;

  set setId(id) => this.id = id;

  get categoryid => this.category_id;

  set categoryid(value) => this.category_id = value;

  get startdate => this.start_date;

  set startdate(value) => this.start_date = value;

  get enddate => this.end_date;

  set enddate(value) => this.end_date = value;

  get currentamount => this.current_amount;

  set currentamount(value) => this.current_amount = value;

  get saveamount => this.save_amount;

  set saveamount(value) => this.save_amount = value;

  get getAchieve => this.achieve;

  set setAchieve(achieve) => this.achieve = achieve;

  GoalModel();
  GoalModel.withId(this.id, this.category_id, this.current_amount,
      this.save_amount, this.start_date, this.end_date, this.achieve);
  GoalModel.withOutId(this.category_id, this.current_amount, this.save_amount,
      this.start_date, this.end_date, this.achieve);

  Map<String, dynamic> toMap() => {
        'id': id,
        'category_id': category_id,
        'start_date': start_date,
        'end_date': end_date,
        'current_amount': current_amount,
        'save_amount': save_amount,
        'achieve': achieve
      };

  GoalModel.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    save_amount = map['save_amount'];
    current_amount = map['current_amount'];
    category_id = map['category_id'];
    start_date = map['start_date'];
    end_date = map['end_date'];
    achieve = map['achieve'];
  }
}
