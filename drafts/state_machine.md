
state_machine(s) gem - model process flows with finite state machines (FSM)


## What's a state machine? What's a finite state machine (FSM)?

A state machine or finite state machine (FSM)
lets you model a traffic light, a shopping cart checkout procedure,
a conference proposal process and many more "real world"
tasks using 1) states, 2) events, and 3) transitions.
Or to quote the Wikipedia:

> A finite-state machine (FSM) or finite-state automaton (plural: automata),
> or simply a state machine, is a mathematical model of computation used to design both computer programs
> and sequential logic circuits.
> It is conceived as an abstract machine that can be in one of a finite number of states.
> The machine is in only one state at a time; the state it is in at any given time is called the current state.
> It can change from one state to another when initiated by a triggering event or condition;
> this is called a transition. A particular FSM is defined by a list of its states,
> and the triggering condition for each transition.


## Example: The State of the Football Match


<!--
[:scheduled]  #start ->[:playing]
[:playing]  #finish->[:finished]
-->

![](i/state_machine_match.png)


Let's start defining a state machine for modelling football matches in Ruby.

~~~
class Match

  state_machine :initial => :scheduled do
    event :start do
      transition :scheduled => :playing
    end
    event :finish do
      transition :playing => :finished
    end
  end

end
~~~

That you can use like:

~~~
m = Match.new
m.state        # => :scheduled
m.scheduled?   # => true
m.playing?     # => false
m.finished?    # => false
m.can_finish?  # => false
m.can_start?   # => true

m.start        # transition from :scheduled to :playing by calling event method e.g. start
m.state        # => :playing
m.playing?     # => true
m.can_start?   # => false
m.can_finish?  # => true

m.finish
m.state        # => Trivia Quiz: a) :scheduled, b) :playing, c) finished ???
~~~

1) The state is a variable that holds - surprise, surprise - the state of your model.
All possible states are strings (symbols) e.g. :scheduled, :playing, :finished.

2) Events are methods (e.g. Match#start, Match#finish) that change the state of the model
(that is, transition from one state to another e.g. from :playing to :finished).


Why use a state machine?  Because it lets you do more with less code thanks to
automata theory packed-up into ready-to-use gems for use in your models in practice. 


## What's the state_machine(s) gem?

Let's thank Aaron Pfeifer and friends - who started the state_machine gem and
 and friends - who continue with the state_machines gem
  that lets you creating state machines for attributes on any Ruby class.

Let's continue the football match example and let's add more states.
Football matches in the real-world can get canceled, postponed, awarded points
if canceled or can get rescheduled or matches can get scheduled for a matchday but not yet timed
for fixed day and time and so on and on. A picture says more than a thousand words:

![](i/state_machine_match_ii.png)

<!--
[:scheduled]  #time ->[:timed]
[:timed] #start->[:playing]
[:timed] #postpone->[:postponed]
[:postponed] #time->  [:timed]

[:playing]  #finish->[:finished]
[:playing]  #cancel->[:canceled]

[:scheduled] <-#reschedule [:canceled]
[:canceled]  #award-> [:awarded]
-->

Let's define the state machine in Ruby using the state_machine machinery:

~~~
class Match

  state_machine :initial => :scheduled do
    event :time do
      transition [:scheduled,:postponed] => :timed
    end
    event :postpone do
      transition :timed => :postponed
    end
    event :start do
      transition :timed => :playing
    end
    event :cancel do
      transition [:timed,:postponed,:playing] => :canceled
    end
    event :reschedule do
      transition :canceled => :scheduled
    end
    event :finish do
      transition :playing => :finished
    end
    event :award do
      transition :canceled => :awarded
    end
  end

end
~~~

And let's try it out:

~~~
m = Match.new
m.state        # => :scheduled
m.scheduled?   # => true
m.timed?       # => false
m.can_start?   # => false
m.time
m.timed?       # => true
m.can_start?   # => true
m.start
m.playing?     # => true
m.finished?    # => false
m.can_cancel?  # => true
...
~~~

What else can state_machine do for you? Let's store the state in a database table w/ ActiveRecord.
First let's create a table with the required column - surprise, surprise - called state:

~~~
create_table :matches do |t|
  t.string :state
end
~~~

And define the Match class derived from ActiveRecord::Base.

~~~
class Match < ActiveRecord::Base
  ## same as above
end
~~~

That's it. Let's test drive with an in-memory SQLite database:

~~~
require 'active_record'
require 'state_machine'

ActiveRecord::Base.establish_connection(
  adapter: 'sqlite3',
  database: ':memory:'
)

ActiveRecord::Schema.define do
  create_table :matches do |t|
    t.string :state

    t.string :teams      # e.g. Manchester United - FC Barcelona
    t.string :scores     # e.g.  1-2  or 1-1; 2-2 a.e.t 5-5 pen.
  end
end


class Match < ActiveRecord::Base
  ## same as above
end

~~~


That's just the beginning. More state_machine highlights include:

- 


## Find Out More 

state_machines (ActiveRecord 4.1+)

* home     :: [github.com/state-machines/state_machines](https://github.com/state-machines/state_machines)
* gem      :: [rubygems.org/gems/state_machines](https://rubygems.org/gems/state_machines)
* rdoc     :: [rubydoc.info/gems/state_machines](http://rubydoc.info/gems/state_machines)

state_machine (ActiveRecord up-to 4.0.x)

* home     :: [github.com/pluginaweek/state_machine](https://github.com/pluginaweek/state_machine)
* gem      :: [rubygems.org/gems/state_machine](https://rubygems.org/gems/state_machine)
* rdoc     :: [rubydoc.info/gems/state_machine](http://rubydoc.info/gems/state_machine)
