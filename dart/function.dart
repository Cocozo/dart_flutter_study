// named parameter
max({int? a, required int b}) => a! > b ? a : b;

// named parameter with default value
max_default({int a = 10, int b = 20}) => a > b ? a : b;

void main(List<String> args) {
  // named parameter를 사용할 시 명시적으로 호출할때 매개변수의 이름명을 명시해주어야 한다.
  int a = max(a: 10, b: 20);
  print(a);
}
