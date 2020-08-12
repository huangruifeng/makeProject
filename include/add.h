#pragma once

#include"test.h"

class Add
{
public:
    Add(Test t):_a(t)
    {}
    int add();
private:
    Test _a;
};