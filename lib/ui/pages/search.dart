import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_first_flutter_project/controllers/search_controller.dart';
import 'package:my_first_flutter_project/ui/views/loading.dart';

class SearchPage extends StatelessWidget {
  static String route = '/search';
  SearchPage({super.key});
  final _search = TextEditingController();
  final _controller = SearchController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Search For Users"),
      ),
      body: Container(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            TextFormField(
              controller: _search,
              decoration: InputDecoration(
                  hintText: 'Search For user email',
                  suffixIcon: Obx(
                    () => _controller.busy.isTrue
                        ? const LoadingView()
                        : IconButton(
                            onPressed: () async {
                              if (_search.text.isNotEmpty) {
                                //do search
                                _controller.search(_search.text);
                              }
                            },
                            icon: const Icon(Icons.search),
                          ),
                  )),
            ),
            Obx(
              () => _controller.busy.isTrue
                  ? const LoadingView()
                  : Expanded(
                      flex: 2,
                      child: ListView.separated(
                        separatorBuilder: (context, index) => const Divider(),
                        shrinkWrap: true,
                        itemBuilder: ((context, index) => ListTile(
                              trailing: IconButton(
                                icon: const Icon(Icons.add),
                                onPressed: () async {
                                  //add into chat list then start chating.
                                  Get.back(result: _controller.users[index]);
                                },
                              ),
                              title: Text(
                                  _controller.users[index].name.toString()),
                              subtitle: Text(_controller.users[index].email),
                            )),
                        itemCount: _controller.users.length,
                      ),
                    ),
            )
          ],
        ),
      ),
    );
  }
}
