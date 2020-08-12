#pragma once

class Test {
public:
     Test(int c,int d):_a(c),_b(d){}
     int add();
     int sub();
private:
    int _a;
    int _b;
    int _c;
};