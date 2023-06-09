import 'package:uda_std_application/models/document.dart';
import 'package:uda_std_application/services/document.service.dart';

import '../abstract/posts_controller.dart';

class DocumentsController extends PostsController<Document> {
  @override
  void onInit() {
    getPost();
    super.onInit();
  }

  @override
  Future<List<Document>> getContent() {
    return DocumentService.getDocuments();
  }
}
