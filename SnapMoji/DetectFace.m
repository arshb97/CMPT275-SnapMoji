//
//  DetectFace.m
//  SnapMoji
//
//  Created by Arshdeep Singh Bhullar on 2018-11-01.
//  Copyright © 2018 Mojo Mojis. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DetectFace.h"
#import <ProjectOxfordFace/MPOFaceSDK.h>
#import "PersonFace.h"
//#import "ImageHelper.h"

//  Worked on by: Arshdeep Bhullar
//
//  Changelog:
//  1.0 - Initial commit
//
//  Known bugs:
//  No known bugs

@implementation DetectFace : NSObject

extern NSString *mYGlobalVariable = @"";                  //global variable

    UIImage * _selectedImage;
    NSMutableArray * _detectionFaces;

- (NSString *) detectAction: (UIImage *) image  {
    _selectedImage = image;
    
    static NSString *const ProjectOxfordFaceSubscriptionKey = @"1b46b1e1a8784524a56c1bf76e4549f8";
    static NSString *const ProjectOxfordFaceEndpoint = @"https://westcentralus.api.cognitive.microsoft.com/face/v1.0";
    __block NSString *emotion = @"";
    
    MPOFaceServiceClient *client = [[MPOFaceServiceClient alloc] initWithEndpointAndSubscriptionKey:ProjectOxfordFaceEndpoint key:ProjectOxfordFaceSubscriptionKey];
    
    NSData *data = UIImageJPEGRepresentation(_selectedImage, 0.8);
    
    [client detectWithData:data returnFaceId:YES returnFaceLandmarks:YES returnFaceAttributes:@[@(MPOFaceAttributeTypeEmotion)] completionBlock:^(NSArray<MPOFace *> *collection, NSError *error) {
        
        [_detectionFaces removeAllObjects];
        for (MPOFace *face in collection)
        {
            emotion = [NSString stringWithFormat: @"%@", face.attributes.emotion.mostEmotion];
            mYGlobalVariable = emotion;
            
            NSLog(@"Printing in obj-c function");
            NSLog(@"%@emotion", face.attributes.emotion.mostEmotion);
            NSLog(@"End of Printing in obj-c");
           }
        }
     ];
     return emotion;
}

-(NSString *) globalVariableGetter
{
    return mYGlobalVariable;
}

@end
