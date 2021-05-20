import 'package:flutter/material.dart';

class CreateEditNotePage extends StatefulWidget {
  @override
  _CreateEditNotePageState createState() => _CreateEditNotePageState();
}

class _CreateEditNotePageState extends State<CreateEditNotePage> {
  var description = "";
  var textController = TextEditingController();
  var isEditing = false;

  @override
  void initState() {
    WidgetsBinding.instance!.addPostFrameCallback((timeStamp) {
      if (ModalRoute.of(context)!.settings.arguments != null) {
        description = ModalRoute.of(context)!.settings.arguments as String;
        textController.text = description;
        setState(() {
          isEditing = true;
        });
      }
    });

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(isEditing ? "Edit Note" : "Create Note"),
        centerTitle: true,
        actions: [
          if (isEditing)
            IconButton(
                icon: Icon(Icons.delete),
                onPressed: () {
                  Navigator.pop(context, "");
                }),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(32.0),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          TextField(
            controller: textController,
            decoration: InputDecoration(labelText: "Descrição"),
            maxLines: 10,
            onChanged: (value) {
              setState(() {
                description = value;
              });
            },
          ),
          SizedBox(
            height: 32,
          ),
          if (description.isNotEmpty)
            Row(mainAxisAlignment: MainAxisAlignment.center, children: [
              SizedBox(
                width: 250,
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context, description);
                  },
                  child: Text("Salvar"),
                ),
              ),
            ])
        ]),
      ),
    );
  }
}
