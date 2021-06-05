### Introduction
`Polygon Clipping` is an old but challenging topic. There are many famous algorithms out there but not all of them would solve your problems. Don't get me wrong, they are great. Some could solve issues another can't, some are faster than others. Below is the list of those algorithms and their drawbacks that you should at least take a look at:

* [Greiner–Hormann](https://en.wikipedia.org/wiki/Greiner%E2%80%93Hormann_clipping_algorithm)
* [Sutherland–Hodgman](https://en.wikipedia.org/wiki/Sutherland%E2%80%93Hodgman_algorithm)
* [Vatti](https://en.wikipedia.org/wiki/Vatti_clipping_algorithm)
* [Weiler–Atherton](https://en.wikipedia.org/wiki/Weiler%E2%80%93Atherton_clipping_algorithm)

### The approach of this project
I found an open source [Clipper library](http://www.angusj.com/delphi/clipper.php), which could solve most of the problems above.

I used Unity, which is powerful and easy to have the demo set up quickly. The only thing I needed to do is to add a middleware `ClipperMiddleWare.cs` to converting from the library data structure into Unity data structure. Other than that, I added `DemoTest.cs`, which basically the play ground logic. With Unity, the logic is pretty straight forward to implement.

Using the this library, most of the things work out of the box. As you can see I added very little effort to get the whole thing working.

### Result
Polygon Clipping works with two closed polygons
<div>
    <img src="assets/db/img/blogs/SOLARSKYRISE_05.gif" class="blog-image" />
</div>
<br/>

Polygon Clipping works with multiple polygons and complicated cases
<div>
    <img src="assets/db/img/blogs/SOLARSKYRISE_06.gif" class="blog-image" />
</div>
<br/>

### Reference
[Clipper library](http://www.angusj.com/delphi/clipper.php)

[Source code](https://github.com/jimmy-vo/unity-polygon-clipping)