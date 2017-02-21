#import <Foundation/Foundation.h>

int main() {
	NSArray* args = [[NSProcessInfo processInfo] arguments];
	NSFileHandle* stdout = [NSFileHandle fileHandleWithStandardOutput];
	NSData* data = nil;
	if ([args count] == 1) {
		data = [@"yes\n" dataUsingEncoding: NSUTF8StringEncoding];
	} else {
		NSRange rn;
		rn.location = 1;
		rn.length = [args count] - 1;

		data = [[NSString stringWithFormat:@"%@\n", [[args subarrayWithRange: rn] componentsJoinedByString: @" "]] dataUsingEncoding: NSUTF8StringEncoding];
	}

	while (true) {
		[stdout writeData:data];
	}
}

