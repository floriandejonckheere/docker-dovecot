# Docker Dovecot

This Dockerfile provides a container running Dovecot over TLS in a multi-domain LDAP setup. Dovecot is configured to use the LDAP structure from the [thalariond LDAP server](https://github.com/floriandejonckheere/thalariond/blob/ldap/LDAP.md), and uses authentication binds as authentication (and authorization).

## Configuration

### Dovecot

Configure dovecot in `etc/dovecot/`. Refer to the [dovecot wiki](wiki2.dovecot.org) for extended configuration.
Don't forget to place or symlink your keys in `etc/ssl` and modify the configuration accordingly

## Build

```
$ ./build.sh
```

## Execution

```
$ ./run.sh
```
