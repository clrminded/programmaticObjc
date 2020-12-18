#import "Project1.h"

@interface Project1 () <UITableViewDelegate,UITableViewDataSource>
 
// I really just got lost doing this
@property (strong,nonatomic) UITableView *table;
@property (strong,nonatomic) NSArray *content;
 
@end

@implementation Project1

NSMutableArray *projects;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blueColor];
    [self cofigureTableview];
    self.content = @[ @"Project1", @"Project2"];
}

-(void)cofigureTableview
{
    self.table = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.table.delegate = self;
    self.table.dataSource = self;
    [self.view addSubview:self.table];
}
 
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _content.count;
}
 
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"cellIdentifier";
    
    UITableViewCell *cell = [self.table dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if(cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
        
    }
    cell.textLabel.text =  [_content objectAtIndex:indexPath.row];
    return cell;
}
 
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
   
    NSLog(@"title of cell %@", [_content objectAtIndex:indexPath.row]);
}
@end

