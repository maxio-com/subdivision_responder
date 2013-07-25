Subdivision Responder
=====================

A simple Rack app that responds with subdivisions (states and provinces)
when queried with an alpha2 country code.

```
curl http://example.com/subdivisions\?country_code\=US
{"US":[["Alaska","AK"],["Alabama","AL"],...]}
```

Installation for use in a Rails app
-----------------------------------

In your `Gemfile`:

```
gem 'subdivision_responder'
```

In your `config/routes.rb`:

```
mount SubdivisionResponder::RackApp.new => '/subdivisions'
```

Data
----

All country and subdivision data is sourced from the [countries
gem](https://github.com/hexorx/countries)


Copyright
---------

MIT Licensed

Copyright (c) 2013 Michael Klett / Chargify

See LICENSE.txt for further details.

