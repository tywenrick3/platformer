//Source: https://www.reddit.com/r/gamemaker/comments/3zxota/splitting_strings/

function split_string(string_sentence, split_by){
	
//var string_sentence = "split,by,commas"; //string to split
//var split_by = ","; //string to split the first string by
var slot = 0;
var splits; //array to hold all splits
var str2 = ""; //var to hold the current split we're working on building

var i;
for (i = 1; i < (string_length(string_sentence)+1); i++) {
    var currStr = string_copy(string_sentence, i, 1);
    if (currStr == split_by) {
        splits[slot] = str2; //add this split to the array of all splits
        slot++;
        str2 = "";
    } else {
        str2 = str2 + currStr;
        splits[slot] = str2;
    }
}


return splits;
}