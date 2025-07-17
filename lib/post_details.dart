import 'package:flutter/material.dart';
import 'package:practice/no_internet_connection.dart';
import 'package:practice/provider/post_provider.dart';
import 'package:provider/provider.dart';

class PostDetails extends StatefulWidget {
  PostDetails({super.key});

  @override
  State<PostDetails> createState() => _PostDetailsState();
}

class _PostDetailsState extends State<PostDetails> {
  @override
  void initState() {
    super.initState();
    getValueFromApi();
  }

  void getValueFromApi() {
    Future.microtask(() async {
      final postController =
          Provider.of<PostController>(context, listen: false);
      await postController.getPost();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Posts")),
      body: Consumer<PostController>(
        builder: (context, postController, child) {
          // if (postController.loader) {
          //   return Center(child: CircularProgressIndicator());
          // }
          // if (postController.postList.isEmpty) {
          //   return Center(child: Text("No data"));
          // }

          return postController.hasInternet
              ? Expanded(
                  child: ListView.builder(
                    itemCount: postController.postList.length,
                    itemBuilder: (context, index) {
                      final post = postController.postList[index];
                      return Card(
                        margin: EdgeInsets.all(8),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("Title: ${post.title}",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                              SizedBox(height: 6),
                              Text("Body: ${post.body}"),
                              Text("Reactions: ${post.reactions}"),
                              Text("Tags: ${post.tags}"),
                              Text("Views: ${post.views}"),
                              Text("UserId: ${post.userId}"),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                )
              : NoInternetScreen();
        },
      ),
    );
  }
}
