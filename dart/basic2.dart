int expensivemethod() {
  return 10000;
}

// late 키워드를 작성하면 미리 값을 넣지 않아도 된다.
late String name;
void main() {
  name = "kim";
  print(name);

  //해당 변수는 쓰여질때까지는 expensivemethod()를 호출하지 않는다.
  late int latecall = expensivemethod();

  //final, const 둘다 값을 변경할 수 없는 상수 키워드지만, 차이점이 있다.

  // final 키워드는 실행중 해당 변수가 선언되는시점에서 값이 고정됨.
  final a = 10;
  final int a2 = 10;

  // const 키워드는 컴파일할시 값이 고정됨.
  const b = 10;
  const int b2 = 10;
}
