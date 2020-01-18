## Setup
Please make sure that you have ruby 2.3 or higher installed.

```
gem install bundler
```

Once you have Ruby + Bundler installed, you can install the gem dependencies for this test with this command:

```
bundle install
```

Then you can start running the tests:

```
bundle exec rspec
```

### Setup for docker users
```
docker-compose up
```

After the image is built you can run:

```
docker-compose run pivot bundle exec rspec
```