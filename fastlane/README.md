fastlane documentation
----

# Installation

Make sure you have the latest version of the Xcode command line tools installed:

```sh
xcode-select --install
```

For _fastlane_ installation instructions, see [Installing _fastlane_](https://docs.fastlane.tools/#installing-fastlane)

# Available Actions

### set_build_numbers_to_current_timestamp

```sh
[bundle exec] fastlane set_build_numbers_to_current_timestamp
```



----


## iOS

### ios build_setup

```sh
[bundle exec] fastlane ios build_setup
```



### ios deploy_to_testflight

```sh
[bundle exec] fastlane ios deploy_to_testflight
```

Push a new beta build to TestFlight

### ios beta

```sh
[bundle exec] fastlane ios beta
```



### ios prod

```sh
[bundle exec] fastlane ios prod
```



### ios generate_certificates

```sh
[bundle exec] fastlane ios generate_certificates
```



----

This README.md is auto-generated and will be re-generated every time [_fastlane_](https://fastlane.tools) is run.

More information about _fastlane_ can be found on [fastlane.tools](https://fastlane.tools).

The documentation of _fastlane_ can be found on [docs.fastlane.tools](https://docs.fastlane.tools).
