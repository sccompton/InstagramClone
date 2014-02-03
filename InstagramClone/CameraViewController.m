//
//  CameraViewController.m
//  InstagramClone
//
//  Created by Stephen Compton on 2/3/14.
//  Copyright (c) 2014 Stephen Compton. All rights reserved.
//

#import "CameraViewController.h"

@interface CameraViewController ()<UIImagePickerControllerDelegate, UINavigationControllerDelegate>

{
        NSString *imageName;
}
@end

@implementation CameraViewController

- (void)viewDidLoad
{
    [super viewDidLoad];

}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    //    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    //    self.imageView.image = chosenImage;
    //    [picker dismissViewControllerAnimated:YES completion:NULL];
    //    chosenImageURL = [info objectForKey:UIImagePickerControllerReferenceURL];
    
    
    [self.navigationController dismissViewControllerAnimated:YES completion:nil];
    UIImage *image = [info valueForKey:UIImagePickerControllerOriginalImage];
    [selectPhoto setBackgroundImage:image forState:UIControlStateNormal];
    [selectPhoto setTitle:@"" forState:UIControlStateNormal];
    
    NSData *imageData = UIImageJPEGRepresentation(image, 0.1);
    NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) objectAtIndex:0];
    NSFileManager *fileManager = [NSFileManager defaultManager];
    NSArray *fileLists = [fileManager contentsOfDirectoryAtPath:path error:nil];
    int totalCount = 0;
    for (NSString *fileName in fileLists)
    {
        if([[fileName lastPathComponent] hasPrefix:@"image_"]){
            totalCount++;
        }
        NSLog(@"%@",fileLists);
    }
    
    imageName = [NSString stringWithFormat:@"%@/image_%i", path, totalCount];
    [imageData writeToFile:imageName atomically:YES];
    
  //  thumbsNailView.image = image;
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
    [picker dismissViewControllerAnimated:YES completion:NULL];
}






@end
