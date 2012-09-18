var InheritFrom = function(superClass, subClass) {
  function inheritance() { }
  inheritance.prototype = superClass.prototype;
  
  subClass.prototype = new inheritance();
  subClass.prototype.constructor = subClass;
  subClass.baseConstructor = superClass;
  subClass.prototype.superClass = superClass.prototype;
};

(function foo() {
  var foo = 1;
  var coo = 42;
  var doo = "bar";

  function Boo() {
    this.booAttr = 42;
  }

  Boo.prototype.fun = function() {
    console.log("Boo fun: " + this.booAttr);
  }

  function Foobar(arg) {
    this.attr = arg;
  }
  Foobar.prototype = new Boo();
  //InheritFrom(Boo, Foobar);

  Foobar.prototype.myMethod = function(){
    console.log(this.attr);
  }

  f = new Foobar("parameter 1");
  f.myMethod();
  f.fun()
})()
