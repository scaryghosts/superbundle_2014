

Array.prototype.randomElement = function () {
    return this[Math.floor(Math.random() * this.length)];
}

var itemchoices = ['item1', 'item2', 'item3'];

var mux1 = ["hahaha i am a goblin who took this over!!", "Don't look I'm working on this"]
mux1.push("If you don't have at least 30 tickets, drop everything, and go buy some more")
mux1.push("This is the best item in the Super Bundle, do you have enough tickets to win?")
mux1.push("Do you know about the Super Bundle MNI?")

var mux2 = ["Keep buying tickets to make sure you get this item!", "Please pretend whatever text was here before is still here now"]
mux2.push("This item is an item that surely belongs in the Super Bundle RMX!")
mux2.push("I can't say enough good things about the item pictured above")

var chances = [1,2,3,4,5,6,7,8,9]


function muxer_step2(itemchoice) {
    textchoice = mux2.randomElement();
    $('#' + itemchoice).text(textchoice);
}


function muxer(itemchoice) {
    textchoice = mux1.randomElement();
    $('#' + itemchoice).text(textchoice);
    setTimeout(function(){muxer_step2(itemchoice)}, 5000);
}

$(document).ready(function() {
    if (chances.randomElement < 3) {
        return true;
    }

    var itemchoice = itemchoices.randomElement();
    
    
    setTimeout(function(){muxer(itemchoice)}, 4000);
    //setTimeout(function(){muxer_step2(itemchoice)}, 8000);
});
