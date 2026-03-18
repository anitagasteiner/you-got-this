String firstName = 'Anita';
String lastName = 'Gasteiner';


int add(int a, int b) => a + b;

String fullName() {
  return '$firstName $lastName';
}

String greet() {
  return 'Hallo, $firstName!';
}

int calculate(int inputValue) {
  int result = inputValue * 2;
  return result;
}