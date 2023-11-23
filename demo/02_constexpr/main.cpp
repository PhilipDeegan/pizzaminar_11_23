#include <iostream>

template<bool B = true>
auto fn(){
    if constexpr(B)
        return "Hello world";
    else
        return "World hello";
}

int main() {  
  
  std::cout << __LINE__ << " " << fn() << std::endl;  
  std::cout << __LINE__ << " " << fn<false>() << std::endl;
  
  return 0;
}

