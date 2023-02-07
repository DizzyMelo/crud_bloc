import 'package:crud_bloc/locator.dart';
import 'package:crud_bloc/models/user.dart';
import 'package:crud_bloc/repositories/user_repository.dart';
import 'package:mobx/mobx.dart';

part 'user_controller.g.dart';

class UserController = UserControllerBase with _$UserController;

abstract class UserControllerBase with Store {
  final UserRepository _userRepository = locator.get<UserRepository>();

  @observable
  bool isLoading = false;

  @observable
  Exception? exception;

  @observable
  List<User> users = ObservableList<User>.of([]);

  @action
  getUsers() async {
    isLoading = true;
    try {
      users = ObservableList.of(await _userRepository.getAllUsers());
    } on Exception catch (e) {
      exception = e;
    } finally {
      isLoading = false;
    }
  }
}
