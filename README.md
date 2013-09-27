minty-rb
========

Partial [Identity](https://wiki.ucop.edu/display/Curation/Identity)
client in Ruby (minting only).

This is based on [minty](https://github.com/cokernel/minty),
a PHP version of the same program, and directly extracted
from [Presence](https://github.com/uklibraries/presence).

This is geared toward the Identity service we are running at the
University of Kentucky Libraries.  You might need to modify the
code if your Identity service does not present the same interface.

Installation
------------

Add the line

```ruby
gem "minty-rb", :git => "git://github.com/uklibraries/minty-rb.git"
```

to your Gemfile and run bundle install.

Example
-------

```ruby
require 'minty-rb'

m = MintyRb::Minter.new "path/to/minter.yml"
identifier = m.mint
```

Configuration
-------------

A sample configuration file is provided in config/minter.yml.example.

Settings:

* host: where is the Identity service located?

* shoulder: what prefix do you want to use for identifiers?  (This must already exist.)

* elide_string: at the University of Kentucky, we use this to elide our namespace (16417)
from identifiers.  If you use multiple namespaces for identifiers, you should leave this
set to false.  Otherwise, set elide_string to an explicit string (such as "16417/") that
you would like to be removed from minted identifiers before returning them.

---

See LICENSE.txt for terms.
