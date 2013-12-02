Activr demo
===========

Demo application for activr gem.

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
