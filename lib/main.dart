import 'package:flutter/material.dart';
import 'package:yaru/yaru.dart';

void main() => runApp(MaterialApp(
      theme: yaruLightTheme,
      home: HomePage(),
    ));

class HomePage extends StatefulWidget {
  final dataToShow = {
    "First example data": [
      "First string in first list item",
      "Second in first",
      "Example",
      "One"
    ],
    "Second example": [
      "This is another example",
      "Check",
      "It",
      "Out",
      "Here's other data"
    ],
    "Third example": [
      "Flutter is",
      "really",
      "awesome",
      "and",
      "it",
      "now",
      "works",
      "everywhere,",
      "this",
      "is",
      "incredible",
      "and",
      "everyone",
      "should",
      "know",
      "about",
      "it",
      "because",
      "someone",
      "must",
      "be",
      "missing",
      "out",
      "on",
      "a lot"
    ]
  }.entries.toList();

  @override
  createState() => HomePageState();
}

class HomePageState extends State<HomePage> {
  int selected = 0;

  ScrollController _gridScrollController = ScrollController();

  incrementSelected() {
    if (selected != widget.dataToShow.length - 1) {
      setState(() {
        selected++;
      });
    }
  }

  decrementSelected() {
    if (selected != 0) {
      setState(() {
        selected--;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Row(
        children: [
          Container(
              color: Colors.black12,
              width: 400.0,
              child: Column(
                children: [
                  Row(
                    children: [
                      IconButton(
                        icon: Icon(Icons.chevron_left),
                        onPressed: decrementSelected,
                      ),
                      IconButton(
                        icon: Icon(Icons.chevron_right),
                        onPressed: incrementSelected,
                      ),
                      Expanded(
                          child: Center(
                        child: TextButton(
                          child: Text("Reset"),
                          onPressed: () => setState(() => selected = 0),
                        ),
                      ))
                    ],
                  ),
                  Expanded(
                    child: ListView.builder(
                      itemCount: widget.dataToShow.length,
                      itemBuilder: (_, i) => ListTile(
                        title: Text(widget.dataToShow[i].key),
                        leading: i == selected
                            ? Icon(Icons.check)
                            : Icon(Icons.not_interested),
                        onTap: () {
                          setState(() {
                            selected = i;
                          });
                        },
                      ),
                    ),
                  ),
                ],
              )),
          Expanded(
            child: Scrollbar(
              isAlwaysShown: true,
              controller: _gridScrollController,
              child: GridView.builder(
                  controller: _gridScrollController,
                  itemCount: widget.dataToShow[selected].value.length,
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200.0),
                  itemBuilder: (_, i) => Container(
                        width: 200.0,
                        height: 200.0,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            child: Center(
                                child:
                                    Text(widget.dataToShow[selected].value[i])),
                          ),
                        ),
                      )),
            ),
          ),
        ],
      ),
    );
  }
}
