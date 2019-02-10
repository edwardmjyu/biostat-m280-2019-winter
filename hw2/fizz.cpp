#include <Rcpp.h>
#include <iostream>
using namespace Rcpp;
using namespace std;

// [[Rcpp::export]]

void Fizzy_cpp(vector<int> & element){
  for(unsigned i = 0; i < element.size(); ++i) {
    if (element[i] % 5 == 0 & element[i] % 3 == 0)
      std::cout << "FizzBuzz" << std::endl;
    else if (element[i] % 3 == 0) 
      std::cout << "Fizz" << std::endl;
    else if (element[i] % 5 == 0)
      std::cout << "Buzz" << std::endl;
    else 
      std::cout << element[i] << std::endl;
  }
}