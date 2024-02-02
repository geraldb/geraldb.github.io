## Annotate Your @ActiveRecord@ Models with Comments About Your Table Structure - Rails Plugin of the Week

<!-- tags: annotate_models gem rails -->

Welcome to the new Rails Plugin of the Week series highlighting a different Rails plugin (or gem)
each week. Let's kick off the series with the @annotate-models@ gem.  

<!-- more -->


### What's `annotate-models`?


The `annotate-models` gem lets you annotate your `ActiveRecord` models with a comment block  
listing all the records' fields and data types pulled from the database table schema in the Ruby source code. Let's look at `feed_item.rb` - an `ActiveRecord` model for web feed items - as an example: 
 

Before (`feed_item.rb`):

``` ruby
class FeedItem < ActiveRecord::Base
end
```

After (`feed_item.rb`):

``` ruby
# == Schema Information
# Schema version: 20080722054422
#
# Table name: items
#
#  id         :integer(11)  not null, primary key
#  title      :string(255)
#  guid       :string(255)
#  link       :string(255)
#  content    :text
#  published  :datetime
#  updated    :datetime
#  created_at :datetime
#  updated_at :datetime  

class FeedItem < ActiveRecord::Base

end
```

That's all there is to it.  


### Installation and Usage

To get started install the `annotate-models` gem:

```
sudo gem install annotate-models
```

To annotate your models change into your Rails app folder and run `annotate`. That's it. `annotate-models` loops 
over all your models in the `app/models` folder and pulls the table schema from the database and adds a comment block at the top of your Ruby sources. Example:

```
cd planet
annotate
```

To update your `ActiveRecord` annotations after changing the table structure (using Rails database schema migrations) rerun `annotate`. Note, that `annotate-models` will wipe out the comment block from the last run including all comments you add to the block. You have been warned.
  
### History 

Dave Thomas (of Pragmatic Programmers fame) hacked up the first `annotate_models` plugin in a plane in 2006. Cuong Tran gem-ified the plugin and added patches from various contributors.

### References

* [Cuong Tran's `annotate_models` Project Site @ GitHub](http://github.com/ctran/annotate_models)
* [Dave Thomas' `annotate_models` Announcement](http://pragdave.pragprog.com/pragdave/2006/02/annotate_models.html)  




