#pragma once
#include "test.h"
class Sub
{
public:
    Sub(Test a):_a(a)
    {}

    int sub();
private:
    Test _a;
};