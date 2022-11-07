import 'dart:convert';

import 'package:desafio_apirest/app/data/datasoucer/http_client_interface.dart';
import 'package:desafio_apirest/app/data/services/product_service.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class IHttpClientMock extends Mock implements IHttpClient {}

void main() {
  final client = IHttpClientMock();

  test('Pegando todos os dados da api', () async {
    when(() => client.get(data)).thenAnswer((_) async => json.decode(data));

    final provider = ProductProvider(client);
    final products = await provider.getProduct(data);
    expect(
      products?[0].title,
      'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
    );
  });

  test('Deve retorna um link de um imagem do produto', () async {
    final provider = ProductProvider(client);
    final product = await provider.getProduct(data);

    expect(
      product?[0].image,
      'https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg',
    );
  });

  test('Deve retorna o titulo de um produto', () async {
    final provider = ProductProvider(client);
    final product = await provider.getProduct(data);

    expect(
      product?[0].title,
      'Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops',
    );
  });

  test('Deve retorna o id de um produto', () async {
    final provider = ProductProvider(client);
    final product = await provider.getProduct(data);

    expect(product?[0].id, 1);
  });

  test('Deve retorna um descrição do produto', () async {
    final provider = ProductProvider(client);
    final product = await provider.getProduct(data);

    expect(
      product?[0].description,
      'Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday',
    );
  });

  test('Deve retorna a quantidade de votos e a nota do produto', () async {
    final provider = ProductProvider(client);
    final product = await provider.getProduct(data);

    expect(product?[0].rating.count, 120.0);
    expect(product?[0].rating.rate, 3.9);
  });
}

const fakeData = [
  {
    "id": 1,
    "title": "Fjallraven - Foldsack No. 1 Backpack, Fits 15 Laptops",
    "price": 109.95,
    "description":
        "Your perfect pack for everyday use and walks in the forest. Stash your laptop (up to 15 inches) in the padded sleeve, your everyday",
    "category": "men's clothing",
    "image": "https://fakestoreapi.com/img/81fPKd-2AYL._AC_SL1500_.jpg",
    "rating": {"rate": 3.9, "count": 120}
  },
  {
    "id": 2,
    "title": "Mens Casual Premium Slim Fit T-Shirts ",
    "price": 22.3,
    "description":
        "Slim-fitting style, contrast raglan long sleeve, three-button henley placket, light weight & soft fabric for breathable and comfortable wearing. And Solid stitched shirts with round neck made for durability and a great fit for casual fashion wear and diehard baseball fans. The Henley style round neckline includes a three-button placket.",
    "category": "men's clothing",
    "image":
        "https://fakestoreapi.com/img/71-3HjGNDUL._AC_SY879._SX._UX._SY._UY_.jpg",
    "rating": {"rate": 4.1, "count": 259}
  },
];

final data = json.encode(fakeData);
