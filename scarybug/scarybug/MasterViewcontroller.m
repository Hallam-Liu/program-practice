//
//  MasterViewcontroller.m
//  scarybug
//
//  Created by macbook on 17/2/10.
//  Copyright © 2017年 macbook. All rights reserved.
//

#import "MasterViewcontroller.h"
#import "ScaryBugDoc.h"
#import "ScaryBugData.h"
#import "EDStarRating.h"
#import <Quartz/Quartz.h>
#import "NSImage+Extras.h"
@interface MasterViewcontroller ()
@property (weak) IBOutlet NSTableView *bugsTableView;

@property (weak) IBOutlet NSTextField *bugTitleView;

@property (weak) IBOutlet EDStarRating *bugRating;
@property (weak) IBOutlet NSImageView *bugImageView;
@property (weak) IBOutlet NSButton *deleteButton;
@property (weak) IBOutlet NSButton *change;

@end

@implementation MasterViewcontroller

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row   //此方法用于表示view中每行每列所显示的内容。
{
    
    // Get a new ViewCell
    NSTableCellView *cellView = [tableView makeViewWithIdentifier:tableColumn.identifier owner:self];
    //通过makeViewWithIdentifier 得到一个cellView。这里会创建一个基于tableColumn的identifier的cellView。
    // Since this is a single-column table view, this would not be necessary.
    // But it's a good practice to do it in order by remember it when a table is multicolumn.
    if( [tableColumn.identifier isEqualToString:@"Bugcolumn"] )//Bugcolumn是设置的列标识，这里table view只有一列
    {
        ScaryBugDoc *bugDoc = [self.bugs objectAtIndex:row];
        //对象bugDoc 是scaryBugDOC类中字典bugs相对每行的内容，bugs字典中已经声明存下了虫子数据。
        cellView.imageView.image = bugDoc.thumbImage;
        cellView.textField.stringValue = bugDoc.data.title;
        return cellView;
    }
    return cellView;
}
-(void)loadView
{
    [super loadView];
    self.bugRating.starImage = [NSImage imageNamed:@"star.png"];
    self.bugRating.starHighlightedImage = [NSImage imageNamed:@"shockedface2_full.png"];
    self.bugRating.starImage = [NSImage imageNamed:@"shockedface2_empty.png"];
    self.bugRating.maxRating = 5.0;
    self.bugRating.delegate = (id<EDStarRatingProtocol>) self;
    self.bugRating.horizontalMargin = 12;
    self.bugRating.editable=NO;
    self.bugRating.displayMode=EDStarRatingDisplayFull;
    
    
    self.bugRating.rating= 0.0;
}
-(ScaryBugDoc*)selectedBugDoc
{
    NSInteger selectedRow = [self.bugsTableView selectedRow];
    if( selectedRow >=0 && self.bugs.count > selectedRow )
    {
        ScaryBugDoc *selectedBug = [self.bugs objectAtIndex:selectedRow];
        return selectedBug;
    }
    return nil;
    //整数对象selectedRow 是tableView中选择的行数。若该行存在，则将该行的数值在字典bugs对象返回。
}

-(void)setDetailInfo:(ScaryBugDoc*)doc
{
    NSString    *title = @"";
    NSImage     *image = nil;
    float rating=0.0;
    if( doc != nil )
    {
        title = doc.data.title;
        image = doc.fullImage;
        rating = doc.data.rating;
    }
    [self.bugTitleView setStringValue:title];
    [self.bugImageView setImage:image];
    [self.bugRating setRating:rating];
    //将字典中虫子的信息分别显示在viewController的textfield，imageView控件中。
}

- (void)tableViewSelectionDidChange:(NSNotification *)aNotification
// First, you need to know which row is selected. The table view tells its delegate that a row is selected by calling ‘tableViewSelectionDidChange’. So you need to implement that method in our view controller to receive that notification.
//首先应该知道哪行被选择了，使view controller 接收行被选择的消息。
{
    ScaryBugDoc *selectedDoc = [self selectedBugDoc];
    
    // Update info
    [self setDetailInfo:selectedDoc];
    // Enable/Disable buttons based on selection
    BOOL buttonsEnabled = (selectedDoc!=nil);
    [self.deleteButton setEnabled:buttonsEnabled];
    [self.change setEnabled:buttonsEnabled];
    [self.bugRating setEditable:buttonsEnabled];
    [self.bugTitleView setEnabled:buttonsEnabled];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return [self.bugs count];//表示表格中需要显示多少行内容。
}
-(IBAction)addRows:(id)sender{
    // 1. Create a new ScaryBugDoc object with a default name
    ScaryBugDoc *newDoc = [[ScaryBugDoc alloc] initWithTitle:@"New Bug" rating:0.0 thumbImage:nil fullImage:nil];
    //add new bug object to our model dictionary.c创建新的bug对象
    [self.bugs addObject:newDoc];//将新的bug对象加入bugs词典中。
    NSInteger newRowIndex = self.bugs.count-1;
    //Insert new Row in the table view.
    [self.bugsTableView insertRowsAtIndexes:[NSIndexSet indexSetWithIndex:newRowIndex] withAnimation:NSTableViewAnimationEffectGap];//最后是确保新的行的界限可被拖动的操作。
    //select the new bug and scroll to make sure it's visible.
    [self.bugsTableView selectRowIndexes:[NSIndexSet indexSetWithIndex:newRowIndex] byExtendingSelection:NO];
    [self.bugsTableView scrollRowToVisible:newRowIndex];
}
-(IBAction)removeRows:(id)sender{
    // 1. Get selected doc
    ScaryBugDoc *selectedDoc = [self selectedBugDoc];
    if (selectedDoc )
    {
        // 2. Remove the bug from the model
        [self.bugs removeObject:selectedDoc];
        // 3. Remove the selected row from the table view.
        [self.bugsTableView removeRowsAtIndexes:[NSIndexSet indexSetWithIndex:self.bugsTableView.selectedRow] withAnimation:NSTableViewAnimationSlideRight];
        // Clear detail info
        [self setDetailInfo:nil];
       
    }}
- (IBAction)bugTitleDidandEdit:(id)sender {
    // 1. Get selected bug
    ScaryBugDoc *selectedDoc = [self selectedBugDoc];
    if (selectedDoc )
    {
        // 2. Get the new name from the text field
        selectedDoc.data.title = [self.bugTitleView stringValue];
        // 3. Update the cell
        NSIndexSet * indexSet = [NSIndexSet indexSetWithIndex:[self.bugs indexOfObject:selectedDoc]];
        NSIndexSet * columnSet = [NSIndexSet indexSetWithIndex:0];
        [self.bugsTableView reloadDataForRowIndexes:indexSet columnIndexes:columnSet];
    }
}
-(IBAction)change:(id)sender{
ScaryBugDoc *selectedDoc = [self selectedBugDoc];
if( selectedDoc )
{
    [[IKPictureTaker pictureTaker] beginPictureTakerSheetForWindow:self.view.window withDelegate:self didEndSelector:@selector(pictureTakerDidEnd:returnCode:contextInfo:) contextInfo:nil];
}
}
- (void) pictureTakerDidEnd:(IKPictureTaker *) picker
                 returnCode:(NSInteger) code
                contextInfo:(void*) contextInfo
{
    NSImage *image = [picker outputImage];
    if( image !=nil && (code == NSOKButton) )
    {
        [self.bugImageView setImage:image];
        ScaryBugDoc * selectedBugDoc = [self selectedBugDoc];
        if( selectedBugDoc )
        {
            selectedBugDoc.fullImage = image;
            selectedBugDoc.thumbImage = [image imageByScalingAndCroppingForSize:CGSizeMake( 44, 44 )];
            NSIndexSet * indexSet = [NSIndexSet indexSetWithIndex:[self.bugs indexOfObject:selectedBugDoc]];
            
            NSIndexSet * columnSet = [NSIndexSet indexSetWithIndex:0];
            [self.bugsTableView reloadDataForRowIndexes:indexSet columnIndexes:columnSet];
        }
    }
}
@end
