import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:mad2_app/services/remote_service.dart';
import 'models/post.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.setSignedIn}) : super(key: key);
  final void Function(bool signedIn) setSignedIn;
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;

  @override
  void initState() {
    super.initState();
    getData();
  }

  getData() async{
    print('in GetData 1');
    posts = await RemoteService().getPost();
    if (posts != null) {
      print('in GetData 3');

      setState(() {
        isLoaded = true;
      });
    }
    print('in GetData 2');

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Visibility(
        visible: isLoaded,
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
        child: ListView.builder(
          itemCount: posts?.length,
          itemBuilder: (context, index) {
            return Container(
              child: Column(
                children: [
                  Text(posts![index].name, style: const TextStyle(fontSize: 20),),
                  Text(posts![index].localName, style: const TextStyle(fontSize: 20),),
                  Text(posts![index].date.toString(), style: const TextStyle(fontSize: 20),),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}



