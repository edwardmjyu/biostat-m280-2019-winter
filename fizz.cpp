#include <Rcpp.h>
#include <iostream>
using namespace Rcpp;
using namespace std;

// [[Rcpp::export]]

void Fizzy(vector<int> & nums){
  for(unsigned i = 0; i < nums.size(); ++i) {
    if (std::isnan(i))
    if (i % 5 == 0 && i % 3 == 0)
       printf("FizzBuzz\n");
    else if (i % 3 == 0) 
       printf("Fizz\n");
    else if (i % 5 == 0)
      printf("Buzz\n");
    else 
       std::cout << i << std::endl;
    else 
      printf("NA present, integers only!");
      break;
  }
}
