---
layout: default
title: Heroku Notes
---

Note:  Personal Heroku Account Closed Down On Nov 21th, 2022  (Plus All Apps Running On Freebie Dynos) 

> Starting November 28th, 2022, free Heroku Dynos, free Heroku Postgres, 
> and free Heroku Data for Redis will no longer be available.
>
> You have apps using these resources.
> You must upgrade to our new low-cost or other paid plans by this date 
> to ensure your apps continue to run and retain your data.

Heroku will close down on Nov 28th, 2022 - list of shutdown apps  include:

- at365  (beerdb)
- be365  (beerdb)
- brazil2014  (sportbook)
- countrycodes
- diypunkart    (profile as a service)
- footballdb
- note
- pint
- pixelartexchange  (artbase server)
- planetbeer
- planetjekyll
- planetopendata
- planetruby
- planetweb
- plutolive
- plutopluto
- prost
- sportbook
- superbowl
- tipp
- tipp13
- trykramdown
- tryslideshow
- viennarb
- wm2014
- worldcities
- worlddb







## Database Tips

Drop and recreate DB (using postgres.heroku.com dev plan)
on later uploads via:

    $ heroku pg:reset DATABASE_URL --confirm sportbook
    
    $ heroku run rake db:migrate db:seed
    $ heroku restart


## Debugging Tips

Get latest logs via:

    $ heroku logs


## Use more than one Heroku app for one git repo

### Use `--app <name>` option 

Add the `--app <name>` option to select app. Example:

    $ heroku logs --prost
    $ heroku logs --pint

### Check Heroku Git remotes

Use `git remote -v|--verbose` to list all remotes - including all remotes added
by heroku. Example:

    $ git remote -v
    
    origin  git@github.com:geraldb/beer.db.admin.git (fetch)
    origin  git@github.com:geraldb/beer.db.admin.git (push)
    pint    git@heroku.com:pint.git (fetch)
    pint    git@heroku.com:pint.git (push)
    prost   git@heroku.com:prost.git (fetch)
    prost   git@heroku.com:prost.git (push)


### Add new Git remote for Heroku app

Use `git remote add <name> <url>`. Example:

    $ git remote add prost git@heroku.com:prost.git


### Rename Git remote for Heroku app

Use `git remote rename <old> <new>`. Example:

    $ git remote rename heroku pint

