#Check arguments of input and determine whether input is valid
invalid_arg <- function(input) {
  if (is.numeric(input) == 0) {
    print("An input of the argument is a non-numeric, integers only.")
    return(0)
  } else if (is.na(input)) {
    print("An input of the argument is NA, integers only!")
    return(0)
  } else if (is.infinite(input)) {
    print("An input of the argument is infinity and beyond, integers only.")
    return(0)
  } else if (input %% 1 != 0) {
    print("An input of the argument is a non-integer, integers only.")
    return(0)
  } else {
    return(1)
  }
}

#FizzBuzz combines the first function testing args and outputs proper response.
FizzBuzz <- function(x) {
  if (!is.numeric(x)) {
    return ("A non-numeric element was passed as an argument, integers only.")
  } 
  for (input in x) {
    check <- invalid_arg(input)
    if(check) {
      if (input %% 5 == 0 && input %% 3 == 0) {
        print("FizzBuzz")
      } else if (input %% 5 == 0) {
        print("Buzz")
      } else if (input %% 3 == 0) {
        print("Fizz") 
      } else {
        print(input)
      }
    }
  }
}
