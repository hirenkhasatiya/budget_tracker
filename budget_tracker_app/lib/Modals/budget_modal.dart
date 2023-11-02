class Budget {
  int id;
  String name;

  Budget(
    this.name, {
    this.id = 0,
  });
  factory Budget.fromMap({required Map data}) => Budget(
        data['name'],
        id: data['id'],
      );

  Map<String, dynamic> get toMap {
    return {
      'name': name,
    };
  }
}
