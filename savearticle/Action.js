//
//  Action.js
//  SaveArticle
//
//  Created by Jakob Sen on 04.08.19.
//  Copyright © 2019 Jakob Sen. All rights reserved.
//

var Action = function() {};

Action.prototype = {
    
    run: function(arguments) {
        // Here, you can run code that modifies the document and/or prepares
        // things to pass to your action's native code.
        
        // We will not modify anything, but will pass the body's background
        // style to the native code.
        
        
        arguments.completionFunction({ "url" : document.URL, "title": document.title })
    }
};
    
var ExtensionPreprocessingJS = new Action
