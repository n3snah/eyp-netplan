# CHANGELOG

## Unreleased
* Added in support for specifying only DNS Search suffixes without specifying DNS servers.
* Improved module metadata by adding tags network, networking, netplan
* Added PDK 2.4.0 support
* Improved `.fixtures.yaml` to use HTTPS instead of git protocol and added extra dependencies
* Added Unit testing and class documentation for `netplan::config`
* Added Unit testing and class documentation for `netplan::install`
* Added Unit testing and class documentation for defined type `netplan::interface`
* Added Unit testing and class documentation for `netplan`
* Forcing class params to be of specific types
* Updating README.md to reflect support on Ubuntu 20.04

## 0.1.6

* Added Ubuntu 20 support

## 0.1.5

* Updated metadata for **eyp-systemd 0.2.0**

## 0.1.4

* updated concat dependencies

## 0.1.3

* bugfix: search option implementation

## 0.1.2

* bugfix yaml syntax

## 0.1.1

* **netplan::interface**:
  - filename option
  - added **search** option to configure search domains

## 0.1.0

* initial release
