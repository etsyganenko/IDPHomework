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
    @interface viewControllerClass (__TSYViewControllerClassCategory) \
    TSYBaseViewPropertyDefinition(viewClass, propertyName) \
    \
    @end \
    \
    @implementation viewControllerClass (__TSYViewControllerClassCategory) \
    \
    @dynamic propertyName; \
    \
    TSYBaseViewPropertyGetterSynthesize(viewClass, propertyName) \
    \
    @end
