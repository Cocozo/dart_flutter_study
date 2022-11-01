// 기본 main 함수 설정.

void main(List<String> args) {
  //non-nullable 변수
  int nonNullAble = 10;
  //nullable 변수
  int? nullAble = null;

  //null 값인지 아닌지 판단.
  if (nullAble == null)
    print("this is nullable variable");
  else
    print(nullAble);

  nullAble = 10;
  // ?? 구문을 활용하여 null 값의 여부에 따라 다른 값을 줄 수도 있다.
  print(nullAble ?? "this is nullable variable");

  String? str = null;
  print(str?.length ?? 0);
}
