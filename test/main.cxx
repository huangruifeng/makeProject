#include<iostream>
#include<future>
#include<thread>
#include"sub.h"
#include"add.h"

int main()
{
    Test v(3,2);
    std::promise<decltype(v.sub())>p;
    std::thread t([&v,&p]{
        Sub s(v);
        Add a(v);
        std::cout<<a.add()<<std::endl;
        p.set_value(s.sub());
    });
    auto f = p.get_future();
    std::cout<<f.get()<<std::endl;
    t.join();
    return 0;
}