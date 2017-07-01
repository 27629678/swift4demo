//
//  c_language_demo.c
//  swift4demo
//
//  Created by hzyuxiaohua on 2017/6/29.
//  Copyright © 2017年 XY Network Co., Ltd. All rights reserved.
//

#include "c_language_demo.h"

#include "stdlib.h"

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

int use_after_scope_demo() {
    int *pointer = NULL;
    if (1 > 0) {
        int tmp = 2017;
        pointer = &tmp;
        
        tmp = 2018;
    }
    
    printf("use_after_scope_result: %d\n", *pointer);
    *pointer = 2016;
    
    return 0;
}

uint32_t *pointer_to_random_integer_value() {
    uint32_t random = arc4random_uniform(10000);
    // unsafe pointer never store local variable
    
    return &random;
}

int use_after_return_demo() {
    uint32_t *pointer = pointer_to_random_integer_value();
    printf("use_after_return_demo_result: %d\n", *pointer);
    
    return 0;
}
