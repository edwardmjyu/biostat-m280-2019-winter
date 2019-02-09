#include <Rcpp.h>
#include <iostream>
using namespace Rcpp;
using namespace std;

// [[Rcpp::export]]

void Fizzy_cpp(NumericVector & nums){
  for(unsigned i = 0; i < nums.size(); ++i) {
    if (i % 5 == 0 && i % 3 == 0)
      std::cout << "FizzBuzz" << std::endl;
    else if (i % 3 == 0) 
      std::cout << "Fizz" << std::endl;
    else if (i % 5 == 0)
      std::cout << "Buzz" << std::endl;
    else 
       std::cout << i << std::endl;
  }
}
