#!/usr/bash
# Objective: to share the public key from Ubuntu-C to all other hosts

users=(ansible root)
oss=(ubuntu centos)
machines=(1 2 3)
for user in "${users[@]}"
  do
    for os in "${oss[@]}"
      do
        for instance in "${machines[@]}"
          do
            sshpass -f password.txt ssh-copy-id -o StrictHostKeyChecking=no ${user}@${os}${instance}
          done
      done
  done

echo 'SSH Public key has been shared'
