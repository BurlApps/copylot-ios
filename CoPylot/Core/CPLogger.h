//
//  CPLogger.h
//  Pods
//
//  Created by Brian Vallelunga on 7/14/15.
//
//

#import <UIKit/UIKit.h>

#ifndef CPLogger_h
#define CPLogger_h

static inline void CPLog(NSString *format, ...) {
    __block va_list arg_list;
    va_start (arg_list, format);
    NSString *formattedString = [[NSString alloc] initWithFormat:format arguments:arg_list];
    va_end(arg_list);
    NSLog(@"[CoPylot] %@", formattedString);
}

#ifdef CoPylot_ERROR
#define CoPylotError(...) MPLog(__VA_ARGS__)
#else
#define CoPylotError(...)
#endif

#ifdef CoPylot_DEBUG
#define CoPylotDebug(...) MPLog(__VA_ARGS__)
#else
#define CoPylotDebug(...)
#endif

#ifdef CoPylot_MESSAGING_DEBUG
#define MessagingDebug(...) MPLog(__VA_ARGS__)
#else
#define MessagingDebug(...)
#endif

#endif