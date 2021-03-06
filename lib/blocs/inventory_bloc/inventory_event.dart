part of 'inventory_bloc.dart';

@immutable
abstract class InventoryEvent {}

class GetInventoryAnalyticsEvent extends InventoryEvent {
  @override
  String toString() => 'GetInventoryAnalyticsEvent';
}

class UpdateInventoryAnalyticsEvent extends InventoryEvent {
  final InventoryAnalytics inventoryAnalytics;

  UpdateInventoryAnalyticsEvent(this.inventoryAnalytics);
  @override
  String toString() => 'UpdateInventoryAnalyticsEvent';
}

class GetLowInventoryProductsEvent extends InventoryEvent {
  @override
  String toString() => 'GetLowInventoryProductsEvent';
}

class UpdateGetLowInventoryProductsEvent extends InventoryEvent {
  final List<Product> lowInventoryProducts;

  UpdateGetLowInventoryProductsEvent(this.lowInventoryProducts);

  @override
  String toString() => 'UpdateGetLowInventoryProductsEvent';
}

class GetAllCategoriesEvent extends InventoryEvent {
  @override
  String toString() => 'GetAllCategoriesEvent';
}

class UpdateGetAllCategoriesEvent extends InventoryEvent {
  final List<Data> categories;

  UpdateGetAllCategoriesEvent(this.categories);
  @override
  String toString() => 'UpdateGetAllCategoriesEvent';
}

class UpdateLowInventoryProductEvent extends InventoryEvent {
  final String id;
  final int quantity;

  UpdateLowInventoryProductEvent({
    this.id,
    this.quantity,
  });

  @override
  String toString() => 'UpdateLowInventoryProductEvent';
}

// ignore: must_be_immutable
class AddNewCategoryEvent extends InventoryEvent {
  Map category;
  String mainCat;
  String subCat;
  String imageCat;

  AddNewCategoryEvent(
      {this.category, this.mainCat, this.imageCat, this.subCat});
  @override
  String toString() => 'AddNewCategoryEvent';
}

class EditCategoryEvent extends InventoryEvent {
  final Map<dynamic, dynamic> category;

  EditCategoryEvent(this.category);
  @override
  String toString() => 'EditCategoryEvent';
}

class DeleteCategoryEvent extends InventoryEvent {
  final String categoryId;

  DeleteCategoryEvent(this.categoryId);
  @override
  String toString() => 'DeleteCategoryEvent';
}
