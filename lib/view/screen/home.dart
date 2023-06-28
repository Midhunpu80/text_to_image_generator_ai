import 'package:flutter/material.dart';
import 'package:imagegen/service/api.dart';

class home extends StatefulWidget {
  @override
  State<home> createState() => _homeState();
}

class _homeState extends State<home> {
  TextEditingController _controller = TextEditingController();
  String? generatedimage;
  var data;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    // getpostimage(_controller.text);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        elevation: 0,
        shadowColor: Colors.amber,
        toolbarHeight: 100,
        centerTitle: true,
        title: const Text(
          "Ai MDX",
          style: TextStyle(
              color: Colors.white, fontSize: 25, fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.only(
              top: 10,
            ),
            child: Row(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: SizedBox(
                    height: 50,
                    width: 380,
                    child: TextFormField(
                      controller: _controller,
                      decoration: InputDecoration(
                          fillColor: Colors.white,
                          hintText: "Describe your Words",
                          filled: true,
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(20))),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: SizedBox(
              width: 90,
              child: Padding(
                padding: const EdgeInsets.only(right: 0, left: 10),
                child: ElevatedButton.icon(
                    onPressed: () async {
                      generatedimage =
                          await getpostimage(_controller.text.toString());
                      setState(() {});
                    },
                    icon: const Icon(
                      Icons.gradient_sharp,
                      color: Colors.blueAccent,
                    ),
                    label: const Text("genreate")),
              ),
            ),
          ),
          const SizedBox(
            height: 50,
          ),
          generatedimage != null
              ? Column(
                  children: [
                    SizedBox(
                        height: 300,
                        width: MediaQuery.of(context).size.width,
                        child: Image.network(
                          generatedimage!.toString(),
                          height: 200,
                          width: 200,
                        ))
                  ],
                )
              : Image.network(
                  "https://ychef.files.bbci.co.uk/1280x720/p0ff8hmx.jpg",
                  height: 200,
                  width: 200,
                )
        ],
      ),
    );
  }
}
