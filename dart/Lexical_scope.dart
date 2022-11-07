Function makeAdder(int addBy) {
  //해당 익명함수는 makeAdder 를 상위 스코프를 가진다!
  return (int i) => addBy + i;
}

void main() {
  // Create a function that adds 2.
  var add2 = makeAdder(2);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  print(add2(3) == 5);
  print(add4(3) == 7);
}
