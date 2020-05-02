import 'package:flutter/material.dart';
import 'package:gerenteloja/widgets/image_source_sheet.dart';

class ImagesWidget extends FormField<List> {
  ImagesWidget({
    BuildContext context,
    FormFieldSetter<List> onSaved,
    FormFieldValidator<List> validator,
    List initialValue,
    bool autoValidate = false,
  }) : super(
            onSaved: onSaved,
            validator: validator,
            initialValue: initialValue,
            autovalidate: autoValidate,
            builder: (state) {
              return Column(
                children: [
                  Container(
                    height: 90,
                    padding: EdgeInsets.only(top: 8, bottom: 4),
                    child: ListView(
                      scrollDirection: Axis.horizontal,
                      children: state.value.map<Widget>((i) {
                        return Container(
                          height: 70,
                          width: 70,
                          margin: EdgeInsets.only(right: 4),
                          child: GestureDetector(
                            child: i is String
                                ? Image.network(i, fit: BoxFit.cover)
                                : Image.file(i, fit: BoxFit.cover),
                            onLongPress: () {
                              state.didChange(state.value..remove(i));
                            },
                          ),
                        );
                      }).toList()
                        ..add(
                          GestureDetector(
                            child: Container(
                              height: 70,
                              width: 70,
                              child: Icon(Icons.camera_enhance,
                                  color: Colors.white),
                              color: Colors.white.withAlpha(50),
                            ),
                            onTap: () {
                              showModalBottomSheet(
                                context: context,
                                builder: (context) => ImageSourceSheet(
                                  onImageSelected: (image) {
                                    state.didChange(state.value..add(image));
                                    Navigator.of(context).pop();
                                  },
                                ),
                              );
                            },
                          ),
                        ),
                    ),
                  ),
                  state.hasError
                      ? Text(
                          state.errorText,
                          style: TextStyle(
                            color: Colors.red,
                            fontSize: 12,
                          ),
                        )
                      : Container(),
                ],
              );
            });
}
