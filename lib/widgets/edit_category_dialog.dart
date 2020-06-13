import 'package:flutter/material.dart';

class EditCategoryDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Dialog(
      child: Card(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: GestureDetector(
                child: CircleAvatar(),
              ),
              title: TextField(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FlatButton(
                  child: Text("Excluir"),
                  textColor: Colors.red,
                  onPressed: () {},
                ),
                FlatButton(
                  child: Text("Salvar"),
                  onPressed: () {},
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
