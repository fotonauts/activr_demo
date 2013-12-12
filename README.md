Activr demo
===========

Demo application for [activr](https://github.com/fotonauts/activr) gem.

A [MongoDB](http://www.mongodb.org/) database is needed.

A test app is available [on heroku](http://activr-demo.herokuapp.com), feel free to create an account and try it.

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

[![Code Climate](https://codeclimate.com/github/fotonauts/activr_demo.png)](https://codeclimate.com/github/fotonauts/activr_demo)


Install
=======

Install imagemagick first. For example on mac:

```
$ brew install imagemagick
```

Change mongodb `hosts` setting in `config/mongoid.yml` file.

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


Heroku
======

To deploy on heroku:

```
$ heroku create

$ heroku config:set MONGOHQ_URI=mongodb://<user>:<password>@alex.mongohq.com:10056/activr_demo
$ heroku config:set ACTIVR_FORCE_SYNC=true

$ heroku config

$ git push heroku master

$ heroku logs --tail
```

Debug:

```
$ heroku run rails console
```


Todo
====

- Remove duplicated activities
- Install on Heroku / AppFog / DigitalOcean / ...


References
==========

- <https://devcenter.heroku.com/articles/getting-started-with-rails4>
- <https://devcenter.heroku.com/articles/rails4>
- <http://www.elliotbradbury.com/use-mongohq-heroku-without-verifying-account/>
- <https://devcenter.heroku.com/articles/config-vars>
