import 'package:flutter/cupertino.dart';
import 'package:sqllite2/model/employee.dart';
import 'package:sqllite2/utils/database_helper.dart';
import 'package:flutter/material.dart';

class EmployeeScreen extends StatefulWidget {
  final Employee employee;
  EmployeeScreen(this.employee);

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return EmployeeScreenState();
  }
}

class EmployeeScreenState extends State<EmployeeScreen> {
  DatabaseHelper db = new DatabaseHelper();

  TextEditingController _ageController;
  TextEditingController _nameController;
  TextEditingController _departmentController;
  TextEditingController _cityController;
  TextEditingController _descriptionController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    _ageController = new TextEditingController(text: widget.employee.age);
    _nameController = new TextEditingController(text: widget.employee.name);
    _departmentController =
        new TextEditingController(text: widget.employee.department);
    _cityController = new TextEditingController(text: widget.employee.city);
    _descriptionController =
        new TextEditingController(text: widget.employee.description);
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Scaffold(
      appBar: AppBar(
        title: Text('Employee DB '),
        backgroundColor: Colors.indigo,
      ),
      body: Container(
        margin: EdgeInsets.all(15.0),
        alignment: Alignment.center,
        child: Column(
          children: <Widget>[
            TextField(
              controller: _nameController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.perm_identity,
                  color: Colors.redAccent,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.redAccent, style: BorderStyle.solid)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.redAccent, style: BorderStyle.solid)),
                hintText: "Name",
                hintStyle: TextStyle(color: Colors.black),
              ),
              style: TextStyle(color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextField(
              controller: _ageController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.perm_identity,
                  color: Colors.redAccent,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.redAccent, style: BorderStyle.solid)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.redAccent, style: BorderStyle.solid)),
                hintText: "Age",
                hintStyle: TextStyle(color: Colors.black),
              ),
              style: TextStyle(color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextField(
              controller: _departmentController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.perm_identity,
                  color: Colors.redAccent,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.redAccent, style: BorderStyle.solid)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.redAccent, style: BorderStyle.solid)),
                hintText: "Department",
                hintStyle: TextStyle(color: Colors.black),
              ),
              style: TextStyle(color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextField(
              controller: _cityController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.perm_identity,
                  color: Colors.redAccent,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.redAccent, style: BorderStyle.solid)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.redAccent, style: BorderStyle.solid)),
                hintText: "City",
                hintStyle: TextStyle(color: Colors.black),
              ),
              style: TextStyle(color: Colors.black),
            ),
            Padding(
              padding: EdgeInsets.all(5.0),
            ),
            TextField(
              controller: _descriptionController,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.perm_identity,
                  color: Colors.redAccent,
                ),
                enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.redAccent, style: BorderStyle.solid)),
                focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                    borderSide: BorderSide(
                        color: Colors.redAccent, style: BorderStyle.solid)),
                hintText: "Description",
                hintStyle: TextStyle(color: Colors.black),
              ),
              style: TextStyle(color: Colors.black),
            ),
            Padding(padding: EdgeInsets.all(5.0)),
            RaisedButton(
              onPressed: () => {
                if (widget.employee.id != null)
                  {
                    db.updateEmployee(Employee.fromMap({
                      'id': widget.employee.id,
                      'name':  _nameController.text,
                      'age':  _ageController.text,
                      'department': _departmentController.text,
                      'description':  _descriptionController.text,
                      'city':_cityController.text,
                    }))
                        .then((_) {
                      Navigator.pop(context, 'update');
                    })
                  }
                else
                  {
                    db
                        .saveEmployee(Employee(
                            _ageController.text,
                            _nameController.text,
                            _departmentController.text,
                            _cityController.text,
                            _descriptionController.text))
                        .then((_) {
                      Navigator.pop(context, 'save');
                    })
                  }
              },
              child:
                  (widget.employee.id != null) ? Text('update',style: TextStyle(color: Colors.white)
                    ,) : Text('save',style: TextStyle(color: Colors.white)),
              color: Colors.redAccent,
            ),
          ],
        ),
      ),
    );
  }
}
