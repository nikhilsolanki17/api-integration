import 'package:get/get.dart';
import 'package:one/api.dart';
import 'package:one/model.dart';


class UserController extends GetxController {
  var users = <User>[].obs;
  var isLoading = true.obs;

  @override
  void onInit() {
    fetchUsers();
    super.onInit();
  }

  void fetchUsers() async {
    try {
      isLoading(true);
      var fetchedUsers = await UserService().getUsers();
      users.assignAll(fetchedUsers);
    } finally {
      isLoading(false);
    }
  }
}
