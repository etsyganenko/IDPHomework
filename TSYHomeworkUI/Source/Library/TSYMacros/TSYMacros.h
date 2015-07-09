//
//  TSYMacros.h
//  TSYHomeworkUI
//
//  Created by Admin on 16.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#define TSYBaseViewPropertyGetterSynthesize(viewClass, propertyName) \
    - (viewClass *)propertyName { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        \
        return nil; \
    }

#define TSYBaseViewPropertyDefinition(viewClass, propertyName) \
    @property (nonatomic, readonly)   viewClass  *propertyName;

#define TSYViewControllerBaseViewProperty(viewControllerClass, viewClass, propertyName) \
    @interface viewControllerClass (__##viewControllerClass##BaseView) \
    TSYBaseViewPropertyDefinition(viewClass, propertyName) \
    \
    @end \
    \
    @implementation viewControllerClass (__##viewControllerClass##BaseView) \
    \
    @dynamic propertyName; \
    \
    TSYBaseViewPropertyGetterSynthesize(viewClass, propertyName) \
    \
    @end

#define TSYWeakify(variable) \
    __weak __typeof(variable) __TSYWeakified_##variable = variable;

// this method should be called only after TSYWeakify(variable) was called
#define TSYStrongify(variable) \
    __strong __typeof(variable) variable = __TSYWeakified_##variable; \

#define TSYStrongifyAndReturnResultIfNil(variable, result) \
    TSYStrongify(variable); \
    if (!variable) { \
        return result; \
    }

#define TSYEmptyResult

#define TSYStrongifyAndReturnIfNil(variable) \
    TSYStrongifyAndReturnResultIfNil(variable, TSYEmptyResult)

#define TSYStrongifyAndReturnNilIfNil(variable) \
    TSYStrongifyAndReturnResultIfNil(variable, nil)

#define TSYSHOULD_SLEEP 1

#if TSYSHOULD_SLEEP
    #define TSYSleep(sleepingTime)  sleep(sleepingTime);
    #define TSYUsleep(sleepingTime)  usleep(sleepingTime);
#else
    #define TSYSleep(sleepingTime)
    #define TSYUsleep(sleepingTime)

#endif
