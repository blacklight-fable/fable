# Finding Aids

A search interface powered by [Blacklight](http://projectblacklight.org/) for special collections finding aids.

## See it in action!

Development: https://specialcollections.library.nyu.edu/search

# Getting Started

This application is an implementation of [Blacklight](http://projectblacklight.org/) but we're ingesting [EADs (Encoded Archival Description)](http://www.loc.gov/ead/tglib/element_index.html) instead of Marc. Please make sure to familiarize yourself with the [Blacklight Quickstart Guide](https://github.com/projectblacklight/blacklight/wiki/Quickstart) for dependencies and background before getting started with Finding Aids.

The description of EAD in Solr proves to require more configuration so we use [a more comprehensive Solr schema.xml](https://github.com/awead/solr_ead/blob/master/solr/schema.xml). To get your environment working you'll need to generate a jetty-solr instance and then copy our custom schema.xml. We've generated some tasks to help you get started. You can follow the steps below to get your development environment ready:

# Prerequisites

1.  Java 1.7-1.8. If you need to run multiple versions of Java on your machine, you might want to look at [jEnv](http://www.jenv.be/)
2.  Ruby 2.2.6 - 2.3 Will not run without tweaking on Ruby 2.4. If you want to manage multiple versions of Ruby on your machine, look at [RVM](https://rvm.io/) or [rbenv](https://github.com/rbenv/rbenv).
3.  MySQL 5.5 or higher.

# Setting Up Your Development Environment

1.  Start by cloning this repository locally:

```
~$ git clone git@github.com:blacklight-fable/fable.git
```

2.  Install dependencies:

```
~$ cd fable
~$ bundle install
```

3.  Make sure MySQL is running, then create your database and run your migrations:

```
~$ bundle exec rake db:create
~$ bundle exec rake db:migrate
~$ RAILS_ENV=test bundle exec rake db:migrate
```

4.  Generate a local jetty-solr that is Finding Aids ready:

```
~$ bundle exec rake findingaids:jetty:install
```

5.  And start it up:

```
~$ bundle exec rake jetty:start
```

6.  Load some test data in there:

```
~$ bundle exec rake ead_indexer:index EAD=spec/fixtures/fales
~$ bundle exec rake ead_indexer:index EAD=spec/fixtures/tamwag
```

7.  Make sure all your tests are passing:

```
~$ bundle exec rake
```

8.  And start up your local server:

```
~$ bundle exec rails s
```

9.  Visiting `http://localhost:3000` should present you with the development application.


# Use with WebSolr

In WebSolr set up a new instance for EAD indexing with the Blacklight Demo schema.xml. See the `solr/schema.xml` in this repo for schema tweaks.
