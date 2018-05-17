# netplan

#### Table of Contents

1. [Overview](#overview)
2. [Module Description](#module-description)
3. [Setup](#setup)
    * [What netplan affects](#what-netplan-affects)
    * [Setup requirements](#setup-requirements)
    * [Beginning with netplan](#beginning-with-netplan)
4. [Usage](#usage)
5. [Reference](#reference)
5. [Limitations](#limitations)
6. [Development](#development)
    * [TODO](#todo)
    * [Contributing](#contributing)

## Overview

network configuration using netplan.io

## Module Description

interface and routes configuration using netplan.io

## Setup

### What netplan affects

* Creates files on /etc/netplan, can optionally delete unmanaged files
* Reloads configuration automatically

### Setup Requirements

### Beginning with netplan

Use **netplan::interface** and **netplan::route** to configure interfaces and network routes

## Usage

### configure DNS for a given interface

```
netplan::interface { 'enp0s3':
  dns => [ '1.1.1.1', '8.8.8.8' ],
}
```

### demo network routes

```
netplan::route { '69.69.69.0/24':
  gw  => '192.168.56.1',
  dev => 'enp0s8',
}

netplan::route { '69.69.70.0/24':
  gw  => '192.168.56.1',
  dev => 'enp0s8',
}
```

## Reference

TODO

## Limitations

Tested on Ubuntu 18.04

## Development

We are pushing to have acceptance testing in place, so any new feature should
have some test to check both presence and absence of any feature

### TODO

### Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
