//
//  TSYMacros.h
//  TSYHomeworkUI
//
//  Created by Admin on 16.06.15.
//  Copyright (c) 2015 Admin. All rights reserved.
//

#define TSYBaseViewPropertyGetterSynthesize(viewClass, property) \
    - (viewClass *)property { \
        if ([self isViewLoaded] && [self.view isKindOfClass:[viewClass class]]) { \
            return (viewClass *)self.view; \
        } \
        \
        return nil; \
    }

#define TSYBaseViewPropertySynthesize(viewClass, property) \
    @property (nonatomic, readonly)   viewClass  *property;

#define TSYViewControllerBaseViewProperty(viewControllerClass, viewClass, property) \
    @interface viewControllerClass () \
    TSYBaseViewPropertySynthesize(viewClass, property) \
    \
    @end \
    \
    @implementation viewControllerClass \
    \
    @dynamic property; \
    \
    TSYBaseViewPropertyGetterSynthesize(viewClass, property)
