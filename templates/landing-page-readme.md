Firebolt
========

> JavaScript Empowered

Firebolt is a fast and lightweight JavaScript library for modern browsers. Its core functionality is based on jQuery, so if you already know how to use jQuery, you know how to use Firebolt (with a few minor exceptions).

---

__WARNING:__ This project is still in development. The API could change at any time.

---

Similar to [Zepto.js](http://zeptojs.com), Firebolt does not aim for 100% jQuery coverage. It stays lean by only targeting only modern browsers and specifically leaves out jQuery functions that were made obsolete by ES5 (i.e `jQuery.trim()`).

In addition to being very small, Firebolt also aims to be blazing fast. Many functions are heavily perfomance tested using [jsPerf](http://jsperf.com) to obtain the highest possible performance average across today's most commonly used browsers.

### The Secret Sauce

Following in the footsteps of the [Prototype](http://prototypejs.org) framework, Firebolt extends the prototype of native objects. This makes coding with Firebolt feel more natural because you can call functions directly on the objects themselves, which also allows you to write code in ways that provide better perfomance, and more clearly indicate what the code is doing. Here's an example of selecting elements and toggling a [Bootstrap](http://getbootstrap.com) class when they are clicked:

---

```javascript
// jQuery
$('.btn.btn-default').click(function() {
    $(this).toggleClass('btn-default btn-success');
});

// Firebolt
$CLS('btn btn-default').on('click', function() {
    this.toggleClass('btn-default btn-success');
});
```

Even though the code is very similar for both Firebolt and jQuery, what happens behind the scenes is very different. Here's a breakdown of what happens when each piece of code is called:

__jQuery__
1. The CSS selector string is parsed by jQuery/Sizzle
2. All elements in the document with the classes "btn" and "btn-default" are retrieved (possibly with `document.getElementsByClassname()`) and added to an array-like collection
3. The collection is looped over to set a `click` handler on each element
4. When an element is clicked, it is added to another array-like collection
5. That collection is looped over to toggle the specifed classes of each element (which is just the one element)

__Firebolt__
1. The native `document.getElementsByClassName()` function is used directly to retrieve a [HTMLCollection](https://developer.mozilla.org/en-US/docs/Web/API/HTMLCollection) of all elements with the classes "btn" and "btn-default"
2. The HTMLCollection is looped over to set a `click` handler on each element
3. When an element is clicked, `.toggleClass()` is called directly on the element to toggle the specified classes

It is quite obvious that the Firebolt code has less work to do in this example, so it will have better performance. Furthermore, the `.on()` method is used by Firebolt because jQuery's "convenience" event methods have been purposely left out of the libarary. This was done to remove ambiguous behaviour from the `.click()` function, since calling it without parameters (in both Firebolt and jQuery), clicks each element in the collection, which is a completely different use for the function and also makes more sense with the function name.

__Note:__ Since Firebolt is modelled after jQuery, `$('.btn.btn-default')` could have been used instead, in which case the selector string would need to be parsed by Firebolt to figure out that it should call `document.getElementsByClassName()`.

---

Furthermore, Firebolt's code base is alphabetized by class then function name, so it is fairly easy to find and remove any functions you don't need to make the library even smaller should you decide to use it, or on the other side of the spectrum, you can simply extract a few functions if you don't need the whole libary. All of this is just fine since Firebolt is open source software and is released under the friendly [MIT license](https://github.com/FireboltJS/Firebolt/blob/master/LICENSE.txt).


## Browser Support

* Chrome 30+ (tested in 30+ but should support back to at least v21)
* Firefox 24+ (tested in 24+ but should support back to v16)
* Internet Explorer 9+
* Safari 5.1+
* Opera 12.1+
* iOS 5.1+
* Android 3.0+
* Blackberry 10+
* IE Mobile 10+
