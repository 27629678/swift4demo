//
//  c_language_demo.c
//  swift4demo
//
//  Created by hzyuxiaohua on 2017/6/29.
//  Copyright © 2017年 XY Network Co., Ltd. All rights reserved.
//

#include "c_language_demo.h"

int uninitialized_value_demo() {
    int a;
    
    return a + 42;
}

int dereference_demo(int *value) {
    int tmp = *value;
    if (value == NULL) {
        return 0;
    }
    
    return tmp;
}

void start() {
//    printf("uninitialized demo result: %d\n", uninitialized_value_demo());
//    printf("dereference demo result: %d\n", dereference_demo(NULL));
}
