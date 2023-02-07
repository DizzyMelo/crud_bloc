// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic, no_leading_underscores_for_local_identifiers

mixin _$UserController on UserControllerBase, Store {
  late final _$isLoadingAtom =
      Atom(name: 'UserControllerBase.isLoading', context: context);

  @override
  bool get isLoading {
    _$isLoadingAtom.reportRead();
    return super.isLoading;
  }

  @override
  set isLoading(bool value) {
    _$isLoadingAtom.reportWrite(value, super.isLoading, () {
      super.isLoading = value;
    });
  }

  late final _$exceptionAtom =
      Atom(name: 'UserControllerBase.exception', context: context);

  @override
  Exception? get exception {
    _$exceptionAtom.reportRead();
    return super.exception;
  }

  @override
  set exception(Exception? value) {
    _$exceptionAtom.reportWrite(value, super.exception, () {
      super.exception = value;
    });
  }

  late final _$usersAtom =
      Atom(name: 'UserControllerBase.users', context: context);

  @override
  List<User> get users {
    _$usersAtom.reportRead();
    return super.users;
  }

  @override
  set users(List<User> value) {
    _$usersAtom.reportWrite(value, super.users, () {
      super.users = value;
    });
  }

  late final _$getUsersAsyncAction =
      AsyncAction('UserControllerBase.getUsers', context: context);

  @override
  Future getUsers() {
    return _$getUsersAsyncAction.run(() => super.getUsers());
  }

  @override
  String toString() {
    return '''
isLoading: ${isLoading},
exception: ${exception},
users: ${users}
    ''';
  }
}
