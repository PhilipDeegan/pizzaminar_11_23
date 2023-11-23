#include <iostream>

template<typename ...Args>
auto sum_args(Args&&... args){
    return (args + ...);
}

int main() {  
  std::cout << "SUM " << sum_args(5, 4, 5) << std::endl;
  return 0;
}


