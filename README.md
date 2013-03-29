PicoEBayFindingClient
=====================

Pico Objective-C Client for the [eBay Finding API](https://www.x.com/developers/ebay/products/finding-api)


## Note
1. This is only the proxy part of the PicoEBayFindingClient, you need to integrate with [Pico Runtime](https://github.com/bulldog2011/pico) before you can use this proxy, please follow instructions on Pico github site to add the Pico runtime library and the PicoEBayFindingClient in your iOS app, you may also start with the sample mentioned in Reference Sample section below. 
2. You need to fill in `eBayAppId` in `EBayFindingServiceClient` before your app can invoke eBay Finding service.
3. Besides proxy code, this site also hosts the [appledoc for the PicoEBayFindingClient](http://bulldog2011.github.com/PicoEBayFindingClient/).


##Example Usage
With this proxy and the generic Pico runtime library, eBay Finding API invocation on iOS platform is quite simple:

``` objective-c

// start progress activity
        [self.view makeToastActivity];
        
        // Get shared service client
        EBayFindingServiceClient *findingClient = [EBayFindingServiceClient sharedClient];
        findingClient.debug = YES; // enable request/response message logging
        
        // Build request object
        Finding_FindItemsByKeywordsRequest *request = [[[Finding_FindItemsByKeywordsRequest alloc] init] autorelease];
        request.keywords = _searchText.text;
        // only need one item for demo
        Finding_PaginationInput *pagination = [[Finding_PaginationInput alloc] init];
        pagination.pageNumber = [NSNumber numberWithInt:1];
        pagination.entriesPerPage = [NSNumber numberWithInt:1];
        request.paginationInput = pagination;
        [pagination release];
        
        // make API call and register callbacks
        [findingClient findItemsByKeywords:request success:^(Finding_FindItemsByKeywordsResponse *responseObject) {
            
            // stop progress activity
            [self.view hideToastActivity];
            
            if ([Finding_AckValue_SUCCESS isEqualToString:responseObject.ack]) {
                if (responseObject.searchResult.count > 0) {
                    // show the title of the first found item
                    Finding_SearchItem *item = [responseObject.searchResult.item objectAtIndex:0];
                    
                    // start image downloading progress activity
                    [self.view makeToastActivity];
                    // get gallery image
                    NSURL *imageURL = [NSURL URLWithString:item.galleryURL];
                    NSData *imageData = [NSData dataWithContentsOfURL:imageURL];
                    // stop progress activity
                    [self.view hideToastActivity];
                    
                    UIImage *image = [UIImage imageWithData:imageData];
                    [self.view makeToast:item.title duration:3.0 position:@"center" title:@"Success" image:image];
                } else {
                    // no result
                    [self.view makeToast:@"No result" duration:3.0 position:@"center"];
                }
            } else { // response residenet error
                Finding_ErrorData *errorData = [responseObject.errorMessage.error objectAtIndex:0];
                [self.view makeToast:errorData.message duration:3.0 position:@"center" title:@"Error"];
            }
        } failure:^(NSError *error, id<PicoBindable> soapFault) {
            
            // stop progress activity
            [self.view hideToastActivity];
            
            if (error) {
                [self.view makeToast:[error localizedDescription] duration:3.0 position:@"center" title:@"Error"];
            } else if (soapFault) {
                SOAP12Fault *soap12Fault = (SOAP12Fault *)soapFault;
                SOAP12Reasontext *reasonText = [soap12Fault.reason.text objectAtIndex:0];
                [self.view makeToast:reasonText.value duration:3.0 position:@"center" title:@"SOAP Fault"];
            }
        }];

        
```

## Reference Sample 

* [eBayFinding](https://github.com/bulldog2011/pico/tree/master/Examples/eBayFinding) - Hello world like sample using [eBay Finding API](https://www.x.com/developers/ebay/products/finding-api) SOAP call.
* [eBayDemoApp](https://github.com/bulldog2011/pico/tree/master/Examples/eBayDemoApp) - Sample eBay Search App using both eBay Finding API and eBay Shopping API.

##Docs
1. [Wsdl Driven Development on iOS - the Big Picture](http://bulldog2011.github.com/blog/2013/03/25/wsdl-driven-development-on-ios-the-big-picture/)
2. [Pico Tutorial 3 - Hello eBay Finding Service](http://bulldog2011.github.com/blog/2013/03/29/pico-tutorial-3-hello-ebay-finding/)


##Copyright and License
(The MIT License)

Copyright (c) 2013 Leansoft Technology <51startup@sina.com>

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the 'Software'), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE. 