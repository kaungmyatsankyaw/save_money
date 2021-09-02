class DatabaseConstant {
  static final dbName = 'save_money.db';
  static final cardTable = 'cards';
  static final transTable = 'transactions';
  static final saveTable = 'saves';
  static final saveHistoryTable = 'save_history';
  static final cardTableFields = {
    "id": 'id',
    'type': 'type',
    'expired_date': 'expired_date',
    'card_number': 'card_number',
    'holder_name': 'holder_name'
  };

  static final transTableFields = {
    'id': 'id',
    'category_id': 'category_id',
    'amount': 'amount',
    'date': 'date',
    'type': 'type',
    'description': 'description'
  };

  static final saveTableFields = {
    'id': 'id',
    'category_id': 'category_id',
    'start_date': 'start_date',
    'end_date': 'end_date',
    'current_amount': 'current_amount',
    'save_amount': 'save_amount',
    'achieve': 'achieve'
  };

  static final saveHistoryTableFields = {
    'id': 'id',
    'save_id': 'save_id',
    'date': 'date',
    'amount': 'amount'
  };
}
