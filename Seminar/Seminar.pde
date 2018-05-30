int factorial(int n) {
  return (n == 0) ? 1 : n * factorial(n - 1);
}

void setup() {
  println(factorial(5));
}
