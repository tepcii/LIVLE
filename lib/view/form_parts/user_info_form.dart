import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:livle/config/config.dart';
import 'package:livle/services/input_validator.dart';

class IconSelector extends StatefulWidget {

  final String _iconImagePath;
  final Function _onTapEvent;

  IconSelector(this._iconImagePath, this._onTapEvent);

  @override
  _IconSelectorState createState() => _IconSelectorState();
}

class _IconSelectorState extends State<IconSelector> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: <Widget>[
          Container(
            width: 110.0,
            height: 110.0,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
              image: DecorationImage(
                fit: BoxFit.fill,
                image: AssetImage(widget._iconImagePath),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: GestureDetector(
              onTap: widget._onTapEvent,
              child: Container(
                padding: EdgeInsets.all(3.0),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(99.0),
                  color: AppColor.primaryColor,
                ),
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(99.0),
                    color: Colors.blue,
                  ),
                  child: Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      FontAwesomeIcons.pen,
                      color: Colors.white,
                      size: 16,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}


class UserIdInput extends StatefulWidget {
  final onChanged;
  UserIdInput({Key key, this.onChanged}) : super(key: key);

  @override
  _UserIdInputState createState() => _UserIdInputState();
}

class _UserIdInputState extends State<UserIdInput> {
  String _textLength;
  String _maxLength;

  @override
  void initState() {
    _textLength = "0";
    _maxLength = "20";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
        cursorColor: Colors.black,
        autovalidate: true,
        maxLength: int.parse(_maxLength),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,
          prefixIcon: Icon(
            FontAwesomeIcons.userTag,
            color: AppColor.primaryColor,
          ),
          suffixText: "$_textLength/$_maxLength",
          labelText: "",
          labelStyle: TextStyle(
            color: Colors.black,
          ),
          hintText: "ユーザーID",
          hintStyle: TextStyle(
            color: Colors.black,
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 1,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.cyan,
              width: 2,
            ),
          ),
          errorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
          focusedErrorBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.red,
              width: 2,
            ),
          ),
        ),
        validator: (String value) {
          Map result = InputValidator.userId(value);
          if (result["result"] == false) {
            return result["msg"];
          } else {
            return null;
          }
        },
        onChanged: (String value) {
          setState(() {
            _textLength = value.length.toString();
          });
          widget.onChanged(value);
        }
    );
  }
}

class UserNameInput extends StatefulWidget {
  final onChanged;
  UserNameInput({Key key, this.onChanged}) : super(key: key);

  @override
  _UserNameInputState createState() => _UserNameInputState();
}

class _UserNameInputState extends State<UserNameInput> {
  String _textLength;
  String _maxLength;

  @override
  void initState() {
    _textLength = "0";
    _maxLength = "20";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      autovalidate: true,
      maxLength: int.parse(_maxLength),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(
          FontAwesomeIcons.user,
          color: AppColor.primaryColor,
        ),
        suffixText: "$_textLength/$_maxLength",
        labelText: "",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: "ユーザー名",
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.cyan,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
      validator: (String value) {
        Map result = InputValidator.userName(value);
        if (result["result"] == false) {
          return result["msg"];
        } else {
          return null;
        }
      },
      onChanged: (String value) {
        setState(() {
          _textLength = value.length.toString();
        });
        widget.onChanged(value);
      }
    );
  }
}

class UserDescTextField extends StatefulWidget {
  final onChanged;
  UserDescTextField({Key key, this.onChanged}) : super(key: key);

  @override
  _UserDescTextFieldState createState() => _UserDescTextFieldState();
}

class _UserDescTextFieldState extends State<UserDescTextField> {
  String _textLength;
  String _maxLength;

  @override
  void initState() {
    _textLength = "0";
    _maxLength = "100";
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      cursorColor: Colors.black,
      autovalidate: true,
      keyboardType: TextInputType.multiline,
      maxLines: null,
      maxLength: int.parse(_maxLength),
      decoration: InputDecoration(
        filled: true,
        fillColor: Colors.white,
        prefixIcon: Icon(
          FontAwesomeIcons.idCard,
          color: AppColor.primaryColor,
        ),
        suffixText: "$_textLength/$_maxLength",
        labelText: "",
        labelStyle: TextStyle(
          color: Colors.black,
        ),
        hintText: "説明",
        hintStyle: TextStyle(
          color: Colors.black,
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black,
            width: 1,
          ),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.cyan,
            width: 2,
          ),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.red,
            width: 2,
          ),
        ),
      ),
      validator: (String value) {
        Map result = InputValidator.userDesc(value);
        if (result["result"] == false) {
          return result["msg"];
        } else {
          return null;
        }
      },
      onChanged: (String value) {
        setState(() {
          _textLength = value.length.toString();
        });
        widget.onChanged(value);
      }
    );
  }
}