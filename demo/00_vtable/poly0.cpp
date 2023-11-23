
#include "box.hpp"

struct A {
    bool isIn(Point const& point, Box const& box) {
        bool pointInBox = true;
        for (auto iDim = 0u; iDim < dim; ++iDim)
            pointInBox =
                pointInBox & point[iDim] >= box.lower[iDim] && point[iDim] <= box.upper[iDim];
        return pointInBox;
    }
};

template <typename Super>
struct B : public Super {};

auto fn() {
    Box box{{0, 0, 0}, {9, 9, 9}};
    std::vector<Point> points(nPoints, defP);
    std::size_t count = 0;

    B<A> b;
    auto const s = mkn::kul::Now::MILLIS();

    for (std::size_t i = 0; i < nTimes; ++i)
        for (auto const& p : points) count += b.isIn(p, box);

    auto const total = mkn::kul::Now::MILLIS() - s;
    KOUT(NON) << "RUN: " << total << " ms";
    KOUT(NON) << "AVG: " << (total / nTimes) << " ms";
    return count != 320000000;
}

int main() { return fn(); }
