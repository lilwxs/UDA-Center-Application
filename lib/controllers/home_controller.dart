import 'package:uda_std_application/abstract/posts_controller.dart';

import '../services/notifies.service.dart';

class HomeController extends PostsController {
  @override
  void onReady() {
    getPost();
    super.onReady();
  }

  @override
  Future<List> getContent() {
    return NotifiesService.homeNotifies();
  }
}
