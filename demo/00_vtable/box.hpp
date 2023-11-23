#include <vector>
#include <iostream>
#include <cstdint>
#include <array>

#include "mkn/kul/log.hpp"
#include "mkn/kul/time.hpp"

constexpr static std::size_t nTimes = 20;
constexpr static std::uint32_t dim = 3;
using Point = std::array<std::int32_t, dim>;      
constexpr static std::size_t nPoints = 16000000;  
constexpr static Point defP{5, 5, 5};

struct Box {
    Point lower;
    Point upper;
};
