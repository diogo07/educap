// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'home_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$HomeController on _HomeController, Store {
  final _$productsLoadingAtom = Atom(name: '_HomeController.productsLoading');

  @override
  bool get productsLoading {
    _$productsLoadingAtom.reportRead();
    return super.productsLoading;
  }

  @override
  set productsLoading(bool value) {
    _$productsLoadingAtom.reportWrite(value, super.productsLoading, () {
      super.productsLoading = value;
    });
  }

  final _$_HomeControllerActionController =
      ActionController(name: '_HomeController');

  @override
  dynamic setProductsLoading(bool value) {
    final _$actionInfo = _$_HomeControllerActionController.startAction(
        name: '_HomeController.setProductsLoading');
    try {
      return super.setProductsLoading(value);
    } finally {
      _$_HomeControllerActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
productsLoading: ${productsLoading}
    ''';
  }
}
