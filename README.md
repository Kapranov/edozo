# Edozo

### edozo programming challenge

We’re looking for an exceptional candidate who is able to demonstrate
abilities as a “polyglot” programmer, with a broad but deep level of
technical knowledge - and also with a healthy creative streak.

To this end, your challenge is to produce a small application which will
allow a user to sign up using an ``OAuth`` provider of your choosing
(``LinkedIn``, ``Facebook``, ``Twitter``, etc) and create a small property
listing. As an example, here’s what a property listing looks like on
[Rightmove][1]:

> Our property listing should have the following features:

* A description
* Key features
* One or more images
* A floor plan
* A geocoded location which can be shown on a map (eg. Google Maps)

```
# For Devise vs. OmniAuth
# table 'users'
  email:    string
  uid:      string
  provider: string


# For Geocoder, Upload Files,
# table "locations"
  address:        text
  latitude:       float
  longitude:      float
  user_id:        integer
  image_data:     text
  floorplan_data: text
  description:    text

# For Dynamic nested forms
# rails g model Feature description:text location:belongs_to
# table 'features'
  description:text
```

We need both the form to upload the property listing and also a view of
the listing itself. Any other views (eg. a list of all properties that
have been uploaded by the logged in user) would be helpful but not
hugely necessary.

We want to see the following technologies in play:
- Rails
- Postgresql
- Your favourite unit testing framework (we don’t need full test coverage)
- Your favourite way of handling authentication in a Rails app
- Your favourite way of handling file uploads in a Rails app (eg.
  Carrierwave, Paperclip, etc)
- Use of Google Maps API or equivalent
- JavaScript or CoffeeScript
- Sass
  - Perhaps a CSS framework (like Skeleton) might save you a bit of time
- Any other mysterious and exciting technologies you want to impress us
  with!

The code should be pushed to a private Github (or Bitbucket, or equivalent)
repository which we can then check out for review. A README file telling us
anything we need to know in order to get it running would be appreciated.

We’re not looking for a perfect or finished product, so please don’t
spend too many hours on this - we just want to see a demonstration of
your skills.

### 20 March 2017

[1]: http://www.rightmove.co.uk/property-for-sale/property-59186501.html
