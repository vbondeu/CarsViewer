#ifdef __OBJC__
#import <UIKit/UIKit.h>
#else
#ifndef FOUNDATION_EXPORT
#if defined(__cplusplus)
#define FOUNDATION_EXPORT extern "C"
#else
#define FOUNDATION_EXPORT extern
#endif
#endif
#endif

#import "OCHamcrest.h"
#import "HCAssertThat.h"
#import "HCBaseDescription.h"
#import "HCBaseMatcher.h"
#import "HCDescription.h"
#import "HCMatcher.h"
#import "HCSelfDescribing.h"
#import "HCSenTestFailureHandler.h"
#import "HCStringDescription.h"
#import "HCTestFailure.h"
#import "HCTestFailureHandler.h"
#import "HCTestFailureHandlerChain.h"
#import "HCXCTestFailureHandler.h"
#import "HCCollectMatchers.h"
#import "HCInvocationMatcher.h"
#import "HCRequireNonNilObject.h"
#import "HCWrapInMatcher.h"
#import "HCHasCount.h"
#import "HCIsCollectionContaining.h"
#import "HCIsCollectionContainingInAnyOrder.h"
#import "HCIsCollectionContainingInOrder.h"
#import "HCIsCollectionOnlyContaining.h"
#import "HCIsDictionaryContaining.h"
#import "HCIsDictionaryContainingEntries.h"
#import "HCIsDictionaryContainingKey.h"
#import "HCIsDictionaryContainingValue.h"
#import "HCIsEmptyCollection.h"
#import "HCIsIn.h"
#import "HCDescribedAs.h"
#import "HCIs.h"
#import "HCAllOf.h"
#import "HCAnyOf.h"
#import "HCIsAnything.h"
#import "HCIsNot.h"
#import "HCIsCloseTo.h"
#import "HCIsEqualToNumber.h"
#import "HCNumberAssert.h"
#import "HCOrderingComparison.h"
#import "HCClassMatcher.h"
#import "HCConformsToProtocol.h"
#import "HCHasDescription.h"
#import "HCHasProperty.h"
#import "HCIsEqual.h"
#import "HCIsInstanceOf.h"
#import "HCIsNil.h"
#import "HCIsSame.h"
#import "HCIsTypeOf.h"
#import "HCIsEqualIgnoringCase.h"
#import "HCIsEqualIgnoringWhiteSpace.h"
#import "HCStringContains.h"
#import "HCStringContainsInOrder.h"
#import "HCStringEndsWith.h"
#import "HCStringStartsWith.h"
#import "HCSubstringMatcher.h"

FOUNDATION_EXPORT double OCHamcrestVersionNumber;
FOUNDATION_EXPORT const unsigned char OCHamcrestVersionString[];

