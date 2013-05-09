# Heroku Notes


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

