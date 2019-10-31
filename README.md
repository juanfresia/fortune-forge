# fortune-forge

fortune-forge is a tool that helps you make your own cookies for unix fortune
package. It compiles your tasty quotes and packages them in a handy .deb for you
to install and distribute everywhere!

## Where do I begin?

First of all, you will need a couple of things:

- **docker**: this tools uses a docker container to bake the cookies, so you
  will need a machine with a working docker installation.
- **make**: the commands you will use are wrapped around in a `Makefile`.
- **fortune**: it is not a requirement to __build__ the fortunes, but it is
  needed to install them. The .deb package will be built with `fortune` and
`fortune-mod` as a dependency (but `make install` wont install those for you).

## Adding fortunes

The raw quotes and fortunes go into the `quotes` directory. Every file in that
directory will be compiled as a __separate__ fortune cookie database file,
accessible via the `fortuen <db>` command.

Each of the files may contain any number of fortune strings, separated by lines
containing __only one % character__.

This is an example of a cookie file:
```
%
This is the first cookie.
%
This is the second cookie.
And is also a multi-line cookie.
%
```

## Generating the .deb

To package your cookies into a `.deb` simply run `make deb`. It will spin a
docker container, bake your cookies and leave them under
`bin/fortune-forge.deb`.


### Changing the package data

The name of the generated .deb file can be changed without altering the package
name. The package metadata (maintainer, description and name) can be found under
`build/DEBIAN/control` file, and can be changed before building the .deb to
change the package metadata.

