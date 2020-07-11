# jekyll-multisites

Jekyll Multisites allows control for sharing files &amp; directories between multiple Jekyll sites. This allows a developer to share project assets, images, css, scripts etc... across sites.

### Inspiration

This project came out of a need to share code & modular web components across a system of sites, Branding assets, shared call to action banners, modules of custom html, css & javscript, shared vendor assets plugins & gems.

### Purpose

The purpose of `jekyll-multisites` is to demonstrate the capabilities of Jekyll as a tool for sharing assets across multiple builds. HTML, CSS, JavaScript, image assets, plugins & gems can be shared as the source files for a system of static JAMstack websites.   

### Usage

To spin up the example sites first download the git repository: `$ git clone git@github.com:Designaroni/jekyll-multisites.git`

#### Running the sites individually

Install Bundler if you don't already have it:

```
$ gem install bundler
```

Intall the projects needed gems:

```
$ bundle install
```

To build & serve either site run one of the following commands from the repository directory:

```
$ bundle exec jekyll serve --config _config_site_one.yml
$ bundle exec jekyll serve --config _config_site_two.yml
```
