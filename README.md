# Recipes Without Blogs 

A recipe website without the annoying backstories. 

Designed and implemented using [Brutal Web Design](https://brutalist-web.design)

Built and maintained by [Ogden Studios](https://ogdenstudios.xyz)

[Support this project by buying me a coffee](https://ko-fi.com/ogdenstudios).

## TODO 

Check the [issues page](https://github.com/ogdenstudios/recipeswithoutblogs/issues) to see bugs we know about, features we're working on, and other ideas. Please contribute! The entire project is open source and MIT licensed, and we'd love to have some help if you can lend it. 

## Accessibility checks

We use [Pa11y CI](https://github.com/pa11y/pa11y-ci) to check for [WCAG2.0 AAA compliance](https://www.w3.org/WAI/WCAG21/quickref/) on the application. Automated testing isn't configured yet, but you can run `yarn run pa11y-ci` and Pa11y CI will use the configuration found in `.pa11yci`. If you've added a new view, you'll need to add it to the list of URLs to be checked. This will be run on all PRs, and eventually made part of our CI process.

## Test suite 

We use [Rspec](https://github.com/rspec/rspec-rails) for testing. Run `rspec` for the whole test suite, or `rspec spec/path/to/spec.rb` for specific tests. 
