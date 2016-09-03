// Author: Darren Schnare, modified by Bernhard Millauer
// Keywords: javascript,interpolation,string,ruby
// License: MIT ( http://www.opensource.org/licenses/mit-license.php )
// Repo: https://gist.github.com/SeriousM/908ee1e67c79681e8c52
String.prototype.interpolate = function (o) {
    if (!o) return this;
    function getValue(str, context) {
        var ix = str.lastIndexOf('()');
        if (ix > 0 && ix + '()'.length == str.length){
            return context[str.substring(0, ix)]();
        }
        return context[str];
    }
    return this.replace(/#\{(.+?)\}/g, function ($0, $1) {
        var split = $1.split('.'),
            tmp = getValue(split[0], o),
            i, l;
        for (var i = 1, l = split.length; i < l; i++){
            tmp = getValue(split[i], tmp);
        }
        return tmp;
    });
}
 
// Tests:
var t1 = 123,
    t2 = {a: 123},
    t3 = {a: {b: 123}},
    t4 = {a: {f: function(){return 123}}},
    t5 = {a: {f: function(){return {b: 123}}}};
 
"#{t1}".interpolate(this);
"#{t2.a}".interpolate(this);
"#{t3.a.b}".interpolate(this);
"#{t4.a.f()}".interpolate(this);
"#{t5.a.f().b}".interpolate(this);
