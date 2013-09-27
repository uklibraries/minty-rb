minty-rb
========

Partial [Identity](https://wiki.ucop.edu/display/Curation/Identity)
client in Ruby (minting only).

This is based on [minty](https://github.com/cokernel/minty),
a PHP version of the same program, and directly extracted
from [Presence](https://github.com/uklibraries/presence).

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

---

See LICENSE.txt for terms.
