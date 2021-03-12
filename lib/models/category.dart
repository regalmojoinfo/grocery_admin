class Category {
  String message;

  List<Data> data;

  Category({this.message, this.data});

  Category.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    if (json['data'] != null) {
      data = new List<Data>();
      json['data'].forEach((v) {
        data.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int status;
  String sId;
  String categoryName;
  String profileImage;
  List<SubCategory> subCategory;
  String createdAt;
  String updatedAt;
  int iV;

  Data(
      {this.status,
      this.sId,
      this.categoryName,
      this.profileImage,
      this.subCategory,
      this.createdAt,
      this.updatedAt,
      this.iV});

  Data.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    sId = json['_id'];
    categoryName = json['categoryName'];
    profileImage = json['profileImage'];
    if (json['subCategory'] != null) {
      subCategory = new List<SubCategory>();
      json['subCategory'].forEach((v) {
        subCategory.add(new SubCategory.fromJson(v));
      });
    }
    createdAt = json['createdAt'];
    updatedAt = json['updatedAt'];
    iV = json['__v'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['_id'] = this.sId;
    data['categoryName'] = this.categoryName;
    data['profileImage'] = this.profileImage;
    if (this.subCategory != null) {
      data['subCategory'] = this.subCategory.map((v) => v.toJson()).toList();
    }
    data['createdAt'] = this.createdAt;
    data['updatedAt'] = this.updatedAt;
    data['__v'] = this.iV;
    return data;
  }
}

class SubCategory {
  String sId;
  String name;

  SubCategory({this.sId, this.name});

  SubCategory.fromJson(Map<String, dynamic> json) {
    sId = json['_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['_id'] = this.sId;
    data['name'] = this.name;
    return data;
  }
}

// import 'package:cloud_firestore/cloud_firestore.dart';

// class Category {
//   String categoryName;
//   String imageLink;
//   String categoryId;
//   List<SubCategory> subCategories;

//   Category({
//     this.categoryName,
//     this.imageLink,
//     this.subCategories,
//     this.categoryId,
//   });

//   factory Category.fromFirestore(DocumentSnapshot doc) {
//     Map data = doc.data();

//     return Category(
//       categoryName: data['categoryName'],
//       imageLink: data['imageLink'],
//       categoryId: data['categoryId'],
//       subCategories: List<SubCategory>.from(
//         data['subCategories'].map(
//           (item) => SubCategory(
//             subCategoryName: item['subCategoryName'],
//           ),
//         ),
//       ),
//     );
//   }
// }

// class SubCategory {
//   String subCategoryName;
//   SubCategory({
//     this.subCategoryName,
//   });

//   factory SubCategory.fromHashmap(Map<dynamic, dynamic> subCategory) {
//     return SubCategory(
//       subCategoryName: subCategory['subCategoryName'],
//     );
//   }
// }
