# Using HAML-JS with Sprockets and Rails 3.1

## About

Rails 3.1 uses sprockets for its asset pipeline. Rails 3.1 has shown considerable love for SCSS and SASS but has left [HAML] out. We at [Dharana Software Innovations][] are die hard HAML fans. We beleive that it is the best templating language around. So we would like to have it as a part of our client side toolkit as well. The [haml-js] project does exactly that. It was written for Node.js but works well with the browser too.

## How to use it?

The gem includes [haml-js]. You would not have to download it separately. To use this gem, you need to do the following. 

In the `Gemfile`, add the following line.

    gem "haml-sprockets"

Now, you can create hamljs files under `app/assets/javascripts/templates` folder. You can create the templates folder, if it does not already exist.

    // code for app/assets/javascripts/templates/hello.jst.hamljs
    %h1 Hello HAML

You can now access the template anywhere in your javascript or coffeescript code.

    JST["templates/hello"]()

This should give you back the string `"<h1>Hello HAML</h1>"`.

## LICENSE

This is distributed under the MIT license.


[HAML]: http://haml-lang.com/
[haml-js]: https://github.com/creationix/haml-js
[Dharana Software Innovations]: http://www.dharanasoft.com/
