# 플러터 공부 - 1 dart 기본공부

## dart 란 ?

**flutter 에서 쓰이는 언어** 
자바와 비슷하게 버추얼 머신을 이용한 컴파일 방식을 가지고 있고, 이러한 특징 덕분에 **어떤 플랫폼**에서든 쓰일 수 있다.


## dart의 변수선언

~~~dart
//함수 정의

void  printInteger(int  number) {
print('the number is $number');
}

// 기본 main 함수 설정.
void  main(List<String> args) {
int  a = 10;
printInteger(a);
}
~~~

기본적인 선언방식과 함수 생성은 여타 다른 언어와 비슷하지만
분명한 **차이를 지닌 점**이 존재한다

### var 타입
~~~dart
void  main(List<String> args) {
var  variable = 10;
print(variable);
}
~~~
dart는 가지고 있는 값에 대해서 **추론을하여 정의**할 수 있는 var 타입을 가지고 있다. 이를 가지고 타입에 따라 원하는 행동을 수행 할 수 있도록 코드를 작성할 수 있다.

### null safety

참조 : https://www.youtube.com/watch?v=tP9TcrUZoIs

**null safety란?**
프로그램을 작성하다보면 null 값을 참조하게 되어 에러가 발생하게되는 경우가 많은데, null safety 를 사용하면 이를 컴파일러가 컴파일 하기 전에 미리 찾아서 버그를 알려준다.

그렇다고 **null** 자체를 없에는 것이 아니다.  null은 '없는' 값을 효과적으로 표현할수 있는 수단이고, 우리는 이미 이 표현에 상당히 익숙하다.
**하지만!** 들어와야하는 값이 아닌 null 값이 들어오는 경우는 굉장히 좋지않은 상황이기 때문에, 이에 대한 또다른 처리를 해 동작이 올바르게 될 수 있도록 만들어 주는 것 이다.

**dart 는 null safety기능을 항상 지원한다.**
따라서 **null 값을 함부로 사용할 수 없다.**

### dart의  null safety

기본적으로 dart의 **모든 변수는 오브젝트이다.** null을 제외한 하나하나 모두가 클래스 이고, 이는 모두 object 클래스의 **자식 클래스**들이다.

#### nullable 과 non nullable
~~~dart
//non-nullable 변수
int nonNullAble = 10;
//nullable 변수
int? nullAble = null;
~~~
기본적으로 변수 클래스는  null 값을 가질 수 없다. 따라서 null 값을 넣으면 컴파일 에러가 난다. 하지만 nullable 클래스의 변수들은 null값을 가질 수 있다.

#### null 조건 연산자

~~~ dart
int? nullAble = null;

//null 값인지 아닌지 판단.
if(nullAble == null)
print("this is nullable variable");
else
print(nullAble);
// 기존 non nullable 값 대입
nullAble = 10;
//?? 구문을 활용하여 null 값의 여부에 따라 다른 값을 줄 수도 있다.
print(nullAble ?? "this is nullable variable");
~~~
nullable 클래스 null 값이외에도 non nullable 에서 쓰이는 기존 값을 쓸 수도 있다.

이때 nullable은 두가지 상태중 하나가 되는데,
1. 기존 nullable 클래스 그래도 값 대입.
2. 기존 nullable에서 non nullable로 변수가 변환되어 값을 대입.
이 된다.
기본적으로 첫번째 상태 그래도 가지만, 만약에 컴파일러가 이 변수가 **앞으로 nullable 하게 쓰이지 않아도 괜찮다 판단**될 경우. non nullable클래스로 승급시켜 사용할수 있게 된다.


~~~ dart
String? str = null;
print(str?.length ?? 0);
~~~
또한 값이 null 인지 아닌지에 따라 ?. 형식을 붙혀 null값에서 잘못된 원소로의 접근을 처리할 수도 있다.

#### null값 보증 연산자

기본적으로  nullable 클래스의 값은 non nullable의 값으로 넘겨주지 못한다. 
~~~ dart 
// a가 nullable 이기 때문에 컴파일 에러!
int? a = 10
int b = a
~~~
따라서 이를 넘겨주기 위해서, ! 를 뒤에 붙혀줌 으로서 값을 강제적으로 넘겨줄 수 있다.
~~~ dart 
// 이러면 오류가 나지 않고 정상적으로 처리가 됨.
int? a = 10
int b = a!
~~~
단, 값이 null인 경우에는 오류가 발생하니 주의해서 써야할 필요가 있다.

#### late 키워드

~~~ dart
// late 키워드를 작성하면 미리 값을 넣지 않아도 된다.
late String name;
void  main() {
	name = "kim";
	print(name);
}
~~~

late  키워드를 이용하면 선언한 변수는 미리 값을 선언하지 않고 나중에 값을 선언해도 된다. 이는 name이란 변수가 사용되기 전까지는 이 변수를 초기화 시키지 않는데, 이를 이용해서

~~~ dart
//해당 변수는 쓰여질때까지는 expensivemethod()를 호출하지 않는다.
late int latecall = expensivemethod();
~~~
다음과 같지 작성하면, expensivemethod 는 latecall이 사용되기 전까지는  호출되지 않는다.

#### final and const

~~~ dart
//final, const 둘다 값을 변경할 수 없는 상수 키워드지만, 차이점이 있다.

// final 키워드는 실행중 해당 변수가 선언되는시점에서 값이 고정됨.
final  a = 10;
final  int  a2 = 10;

// const 키워드는 컴파일할시 값이 고정됨.
const  b = 10;
const  int  b2 = 10;
~~~

final, const는 둘 다  상수를 만드는 키워드 이다. 하지만 그 둘을 구분해서 써야하는데, 선언시점이 다르기 때문이다.

 - final : 실행중 해당 변수가 선언되는시점에서 값이 고정됨.
 - const : 컴파일할시 값이 고정됨.

따라서 값이 시시각각 변하는 값을 사용할때에는 final 해당 시점을 고정시키기에 사용하기 괜찮으나, const는 컴파일 시점에서 값이 고정되기 때문에 값이 달라질 수 있다.

**final, const 는 변수 뿐만 아니라 배열에도 사용할 수 있다!**

```dart
var foo = const [];
final bar = const [];
const baz = []; // Equivalent to `const []`
```

## dart의 list

특별이 다른 언어에 비해 선언부 자체는 특별한 부분은 없다.
**단!** 여러 모던 언어에 대한 이야기가 있어 그부분만 짚고 넘어간다.


### list

#### spread operation
~~~dart
//... 키워드
var list = [1, 2, 3];
var list2 = [0, ...list];
assert(list2.length == 4);
~~~
자바 스크립트의  스프레드 오퍼레이션을 사용할 수 있다.
허나 이에 null 에러가 일어날 수 있는 이슈에 대해서

~~~dart
var list2 = [0, ...?list];
assert(list2.length == 1);
~~~
처럼 ?을 붙혀 nullable 형식처럼 만들 수 있다.

#### collection if, for
``` dart
// conllection if를 활용하여 조건부 리스트 생성
var nav = ['Home', 'Furniture', 'Plants', if (promoActive) 'Outlet'];

// conllection for를 활용하여 리스트 생성
var listOfInts = [1, 2, 3];
var listOfStrings = ['#0', for (var i in listOfInts) '#$i'];
assert(listOfStrings[1] == '#1');
```

리스트 생성란 안에 인라인 형식의 if문, for문을 넣어  리스트를 생성할 수 있다.

## dart의 함수.

~~~dart
int max(int  a, b) {
	return  a > b ? a : b;
}
~~~
기본적으로 리턴타입, 함수명, 매개변수로 이루어져 있다. 하지만 여기서

~~~dart 
max(int  a, b) {
	return  a > b ? a : b;
}
~~~
처럼 리턴타입을 생략할 경우, 리턴타입을 추론하여 암시적으로 표현하게 된다.

또한 위와같이 한줄로 이루어진 코드일 경우, 
~~~ dart
max(int  a, b) => a > b ? a : b;
~~~
다음과 같은 화살표 표현식을 쓴 인라인 표현식으로도 가능하다.

### named parameter
~~~dart
// named parameter
max({int? a, int? b}) => a! > b! ? a : b;

void main(List<String> args) {
  // named parameter를 사용할 시 명시적으로 호출할때 매개변수의 이름명을 명시해주어야 한다.
  int a = max(a: 10, b: 20);
  print(a);
}
~~~
기본적으로 매개변수들은 값을 필수로 하는 required 키워드를 암시적으로 가지고 있다.
여기서 {} 를 이용해 {param1, param2, …} 로 매개변수들을 이어주면 변수들의 상태는 써도되고 안써도 되는, **optional 상태**가 된다.
값이 없는 null 상태가 될 수 있어 **nullable 클래수 변수들을 사용**하고, 또한 함수 호출시 **매개변수의 이름명을 명시**해주어야 한다.


만약에 named parameter중, 필수적으로 값을 필요로 한다면
~~~dart
// named parameter
max({int? a, required int b}) => a! > b ? a : b;
~~~
매개변수 b와 같이 required 키워드가 붙으면 필수적으로 값을 필요로 하는 매개변수가 된다.

아님 default값을  설정하여
~~~dart
max_default({int a = 10, int b = 20}) => a > b ? a : b;
~~~
다음과 같이 값을 넣지 않을 시를 설정하여 nullable클래스 에서 벗어남과 동시에 기본 값을 설정할 수 있다.

### 익명 함수(Anonymous functions)

~~~dart
const list = ['apples', 'bananas', 'oranges'];
list.map((item) {
  return item.toUpperCase();
}).forEach((item) {
  print('$item: ${item.length}');
});
~~~

dart에서, 함수는 1급 객체이다!  
따라서 함수를 변수처럼 값을 넘겨줄 수 있는데, 따라서 함수를 이름을 붙혀주지 않는 **익명함수** 형식으로 넘겨 줄 수 있다.  
(다른 언어란 비교하자면, **자바스크립트** 처럼 말이다.)

### Lexical scope

dart는 Lexical scope를 따르고 있다.  
Lexical scope는 함수를 어디서 선언하였는지에 따라 상위 스코프를 결정한다.  

~~~dart

bool topLevel = true;

void main() {
  var insideMain = true;

  void myFunction() {
    var insideFunction = true;

    void nestedFunction() {
      var insideNestedFunction = true;

      assert(topLevel);
      assert(insideMain);
      assert(insideFunction);
      assert(insideNestedFunction);
    }
  }
}

~~~

해당 메인 함수를 보면, 각각 의 함수가 선언되었는데, 이 함수들의 상위 스코프는 선언된 스코프를 가지고 있는 함수로 결정된다.   
각각 선언된 변수들은  그 안에서만 활용될 수 있다.  
중요한 점은 함수의 호출이 아니라 함수의 선언에 따라 결정된다는 점이다.

따라서, 해당 코드와 같은 결과물이 나올 수 있다.

~~~ dart
Function makeAdder(int addBy) {
  //해당 익명함수는 makeAdder 함수의 스코프를 상위 스코프를 가진다!
  return (int i) => addBy + i;
}

void main() {
  // Create a function that adds 2.
  var add2 = makeAdder(2);

  // Create a function that adds 4.
  var add4 = makeAdder(4);

  assert(add2(3) == 5);
  assert(add4(3) == 7);
}
~~~

해당 함수가 리턴값을 함수로 가질 경우,   
리턴값으로 나온 함수는 해당 함수를 상위 스코프를 가진다.   
따라서 해당 스코프안에서 선언한 변수, 함수를 **그대로 사용할 수 있다.**  


### 깊은복사, 얇은복사(Deep copy, Shallow copy)


기본적으로  ` = ` 연산자를 사용할 경우 복사대상과 똑같은 주솟값을 똑같이 공유하는 얇은 복사(**Shallow copy**)가 일어 난다.  
**특히** 클래스 오브젝트를 가진 변수를 만들때 많이 겪고는 하는데,  
이는 ` object.clone() `를 이용하거나, 오퍼레이터를 오버로딩 하여 사용하여 각자의 독립적인 깊은복사(**deep copy**) 가 일어나게 할 수 있다.

