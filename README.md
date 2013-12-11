Activr demo
===========

Demo application for [activr](https://github.com/fotonauts/activr) gem.

A [MongoDB](http://www.mongodb.org/) database is needed.

More information [on our tumblr](http://fotopedia-code.tumblr.com)

Technologies:

- [rails 4](https://github.com/rails/rails)
- [mongoid 4](https://github.com/mongoid/mongoid)
- [devise](https://github.com/plataformatec/devise)
- [carrierwave](https://github.com/carrierwaveuploader/carrierwave)
- [resque](https://github.com/resque/resque)
- [bootstrap 3](http://getbootstrap.com)
- [simple form](https://github.com/plataformatec/simple_form)
- [kaminari](https://github.com/amatsuda/kaminari)

Install
=======

Install imagemagick first. For example on mac:

```
$ brew install imagemagick
```

Then:
```
$ bundle install
$ rake db:seed
$ rails s
```

Reset with:

```
$ rm -rf public/uploads/
$ rake db:reset
```

Setup Resque workers:
```
$ brew install redis
$ redis-server /usr/local/etc/redis.conf

$ resque-web

$ VVERBOSE=1 QUEUE=* rake environment resque:work
```

Todo
====

- Remove duplicated activities
- Install on Heroku / AppFog / DigitalOcean / ...
