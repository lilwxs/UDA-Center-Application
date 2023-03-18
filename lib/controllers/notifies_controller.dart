import 'package:uda_std_application/abstract/post.dart';
import 'package:uda_std_application/abstract/posts_controller.dart';
import 'package:uda_std_application/models/notify.dart';

import '../services/notifies.service.dart';

class NotifiesController extends PostsController<Notify> {
  @override
  void onInit() {
    getPost();

    super.onInit();
  }

  @override
  Future<List<Notify>> getContent() {
    return NotifiesService.getNotifies();
  }

  void remove(Post post) {
    NotifiesService.removeNotify(post.id);
    list.remove(post);
    list.refresh();
  }
}
