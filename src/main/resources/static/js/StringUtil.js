/**
 * StringUtil.js
 */

var StringUtil = {
	isEmpty : function(val){
		// test results
	    //---------------
	    // []        true, empty array
	    // {}        true, empty object
	    // null      true
	    // undefined true
	    // ""        true, empty string
	    // ''        true, empty string
	    // 0         false, number
	    // true      false, boolean
	    // false     false, boolean
	    // Date      false
	    // function  false
	
	    if (val === undefined)
	        return true;
	
	    if (typeof (val) == 'function' || typeof (val) == 'number' || typeof (val) == 'boolean' || Object.prototype.toString.call(val) === '[object Date]')
	        return false;
	
	    if (val == null || val.length === 0)        // null or 0 length array
	        return true;
	
	    if (typeof (val) == "object") {
	        // empty object
	
	        var r = true;
	
	        for (var f in val)
	            r = false;
	
	        return r;
	    }
	
	    return false;
	},
	isEquals(val1, val2){
		if(StringUtil.isEmpty(val1) && StringUtil.isEmpty(val2)){
			return true;			// both empty elements should return true
		} 
		if(StringUtil.isEmpty(val1) || StringUtil.isEmpty(val2)){
			return false;
		}
		return val1 === val2;
	},
	objectToString : function(val){
		return !StringUtil.isEmpty(val) ? val.toString() : "";
	},
	number : {
		stringToNumber : function(val){
			return !StringUtil.isEmpty(val) ? parseInt(val, 10) : 0;
		},
		seperateComma : function(val){
			
		}
	}
}