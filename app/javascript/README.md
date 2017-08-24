# Webpack & the Webpacker gem

This directory is managed by webpacker, which integrates the webpack toolchain
with a Rails app. It's an alternative to the traditional Rails asset pipeline
stuff found in app/assets; they can both co-exist.

We are using webpack to compile and manage the Elm code used by this Rails app.

Put pack entry points in the **packs** subdirectory. All other code in subdirectories
adjacent to this file.

See:
https://pragmaticstudio.com/blog/2017/5/12/elm-with-rails-5-1
https://github.com/rails/webpacker
https://medium.com/statuscode/introducing-webpacker-7136d66cddfb
http://samuelmullen.com/articles/embracing-change-rails51-adopts-yarn-webpack-and-the-js-ecosystem/
