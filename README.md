# vision-keepalived

[![Build Status](https://travis-ci.org/vision-it/vision-keepalived.svg?branch=development)](https://travis-ci.org/vision-it/vision-keepalived)

## Parameter

## Usage

Include in the *Puppetfile*:

```
mod 'vision_keepalived',
    :git => 'https://github.com/vision-it/vision-keepalived.git,
    :ref => 'production'
```

Include in a role/profile:

```puppet
contain ::vision_keepalived
```

