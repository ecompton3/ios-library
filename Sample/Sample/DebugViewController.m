/* Copyright Urban Airship and Contributors */

#import "DebugViewController.h"
@import AirshipDebugKit;

@interface DebugViewController()

@property (strong, nonatomic) IBOutlet UITableViewCell *deviceInfoCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *inAppAutomationCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *customEventsCell;
@property (strong, nonatomic) IBOutlet UITableViewCell *eventsCell;

@end


@implementation DebugViewController

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    // REVISIT - change to switch statement
    if ([indexPath isEqual:[self.tableView indexPathForCell:self.deviceInfoCell]]) {
        [self deviceInfo];
    } else if ([indexPath isEqual:[self.tableView indexPathForCell:self.inAppAutomationCell]]) {
        [self inAppAutomation];
    } else if ([indexPath isEqual:[self.tableView indexPathForCell:self.customEventsCell]]) {
        [self customEvents];
    } else if ([indexPath isEqual:[self.tableView indexPathForCell:self.eventsCell]]) {
        [self events];
    }
}

- (void)deviceInfo {
    if (AirshipDebugKit.deviceInfoViewController) {
        [self.navigationController pushViewController:AirshipDebugKit.deviceInfoViewController animated:YES];
    }
}

- (void)inAppAutomation {
    if (AirshipDebugKit.automationViewController) {
        [self.navigationController pushViewController:AirshipDebugKit.automationViewController animated:YES];
    }
}

- (void)customEvents {
    if (AirshipDebugKit.customEventsViewController) {
        [self.navigationController pushViewController:AirshipDebugKit.customEventsViewController animated:YES];
    }
}

- (void)events {
    if (AirshipDebugKit.eventsViewController) {
        [self.navigationController pushViewController:AirshipDebugKit.eventsViewController animated:YES];
    }
}

@end
