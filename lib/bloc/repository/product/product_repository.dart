import 'dart:convert';
import 'package:bloc_learning/model/product/product_model.dart';
import 'package:http/http.dart' as http;

class ProductRepository {
  Future<List<ProductModel>> fetchProduct() async {
    try {
      final response = await http.get(Uri.parse("https://fakestoreapi.com/products"));
      if (response.statusCode == 200) {
        final body = jsonDecode(response.body) as List;
        return body.map((e) {
          return ProductModel(
            id: e['id'] as int,
            title: e['title'] as String? ?? 'No Title',  // Use a default value if null
            // price: e['price'] as int,
            description: e['description'] as String? ?? 'No Description',  // Use a default value if null
            category: e['category'] as String? ?? 'No Category',  // Use default category if null
            image: e['image'] as String? ?? '',  // Provide a fallback for image
            // rating: e['rating'] != null
            //     ? Rating.fromJson(e['rating']) // Parse the Rating object
            //     : null,
          );
        }).toList();
      } else {
        throw Exception('Failed to load products');
      }
    } catch (e) {
      throw Exception('Error while fetching data: $e');
    }
  }
}
