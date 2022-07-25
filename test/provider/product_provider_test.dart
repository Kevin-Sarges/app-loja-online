import 'package:desafio_apirest/provider/product_provider.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Deve retorna um link de um imagem do produto', () async {
    final provider = ProductProvider();
    final product = await provider.getProduct();

    expect(
      product?[0].image,
      'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
    );
  });

  test('Deve retorna o titulo de um produto', () async {
    final provider = ProductProvider();
    final product = await provider.getProduct();

    expect(
      product?[0].title,
      'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
    );
  });

  test('Deve retorna o id de um produto', () async {
    final provider = ProductProvider();
    final product = await provider.getProduct();

    expect(product?[0].id, 1);
  });

  test('Deve retorna um descrição do produto', () async {
    final provider = ProductProvider();
    final product = await provider.getProduct();

    expect(
      product?[0].description,
      'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday',
    );
  });
}
