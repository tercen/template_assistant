import 'package:flutter/material.dart';
import 'dart:convert';
import 'dart:html' as html;
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:url_launcher/url_launcher.dart';


class TemplateConfigWidget extends StatefulWidget {
  final String selectedRepo;
  const TemplateConfigWidget(String s, {super.key, required this.selectedRepo});



  @override
  State<TemplateConfigWidget> createState() => _TemplateConfigWidgetState();
}





class _TemplateConfigWidgetState extends State<TemplateConfigWidget> {
  var fileList = [{"name":"Folder A", "type":"folder"}, 
                  {"name":"Crabs.csv", "type":"file"}];
  
  Icon _getIcon(String fileType){
    switch (fileType) {
      case "folder":
        return const Icon(Icons.folder_rounded);
      default:
        return const Icon(Icons.insert_drive_file_rounded);
    }
  }

  TableRow _createFileItem(String name, String fileType){
    return TableRow(

            children: [
              Align(
                alignment: Alignment.centerLeft,
                widthFactor: 0.1,
                child: _getIcon(fileType),
              ),
              Align(
                alignment: Alignment.centerLeft,
                widthFactor: 10,
                child: InkWell(
                  onTap: () {
                    //TODO expand
                    if( fileType == "folder"){
                      fileList.insert(1, {"name":"Crabs_Edited.csv", "type":"file"});
                      setState((){});
                    }
                  },
                  child: Text(name)
                )
                  
              )
            ],
          );
  }

  @override
  Widget build(BuildContext context) {
    widget.selectedRepo;

    List<TableRow> itemList = [];
    for(int i =0; i < fileList.length; i++){
      var entry = fileList[i];
      itemList.add(_createFileItem(entry["name"]!, entry["type"]!));
    }

    return Material(
      child: Align(
          alignment: Alignment.topLeft,
          child: Column(
            children: [
              const SizedBox(
                height: 25,
              ),
              SizedBox(
                width: 800,
                height: 300,
                child: SingleChildScrollView(
                  child: Table(
                    children: itemList,
                  ),
                )
              )
            ]
          )
          
      )
    );
  }

}