class InputValidator {

  static Map<String, String> _regs = {
    "userId": r'^[a-zA-Z0-9_]+$',
  };

  static Map userId(String value) {
    Map result = {
      "result": true,
      "msg": "",
    };
    if (!_validator(value, _regs["userId"])) {
      result["result"] = false;
      result["msg"] = "半角英数字とアンダーバー以外使用できません。";
    } else if (value.length > 20 || value.length == 0) {
      result["result"] = false;
      result["msg"] = "1文字以上20文字以内で入力してください";
    }
    return result;
  }

  static Map userName(String value) {
    Map result = {
      "result": true,
      "msg": "",
    };
    if (value.length > 20 || value.length == 0) {
      result["result"] = false;
      result["msg"] = "1文字以上20文字以内で入力してください";
    }
    return result;
  }
  static Map userDesc(String value) {
    Map result = {
      "result": true,
      "msg": "",
    };
    if (value.length > 100) {
      result["result"] = false;
      result["msg"] = "100文字以内で入力してください";
    }
    return result;
  }


  static bool _validator(String value, Pattern reg) {
    RegExp regex = new RegExp(reg);
    if (!regex.hasMatch(value))
      return false;
    else
      return true;
  }

}