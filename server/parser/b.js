var InheritFrom = function(superClass, subClass) {
  function inheritance() { }
  inheritance.prototype = superClass.prototype;
  
  subClass.prototype = new inheritance();
  subClass.prototype.constructor = subClass;
  subClass.baseConstructor = superClass;
  subClass.prototype.superClass = superClass.prototype;
};


(function foo2() {
  var foo = 1;
  var coo = 42;
  var doo = "bar";


  function Foo2Bar(arg) {
    this.attr = arg;
  }
  Foo2Bar.prototype = new Boo();
  //InheritFrom(Boo, Foo2Bar);

  Foo2Bar.prototype.myMethod = function(){
    console.log(this.attr);
  }

  f = new Foo2Bar("parameter 1");
  f.myMethod();
  f.fun()

  function Boo() {
    this.booAttr = 42;
  }

  // New comment.
  Boo.prototype.fun = function() {
    /* Another neq comment
     * multiline.
     */
    console.log("Boo fun: " + this.booAttr);
  }
})()
