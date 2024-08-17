#!/usr/bin/env bash
# Using puppet to make changes to configuration file

file { 'etc/ssh/ssh_config':
        ensure => present,
content =>"

        #SSH Client configuration
        host*
        IdentityFile ~/.ssh/school
        PasswordAuthentication no
}