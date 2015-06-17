//
//  TSYMacros.h
//  TSYHomeworkUI
//
//  Created by Admin on 16.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#define TSYBaseViewPropertyGetter(viewClass, property) \
    - (viewClass *)property { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        \
        return nil; \
    }

#define TSYViewControllerBaseViewProperty(viewControllerClass, viewClass, property) \
    @interface viewControllerClass () \
    @property (nonatomic, readonly)   viewClass  *property; \
    \
    @end \
    \
    @implementation viewControllerClass \
    @dynamic property; \
    \
    TSYBaseViewPropertyGetter(viewClass, property)