class budgetModal {
  int id;
  String name;

  budgetModal(
    this.id,
    this.name,
  );
  factory budgetModal.fromMap({required Map data}) => budgetModal(
        data['id'],
        data['name'],
      );
}
