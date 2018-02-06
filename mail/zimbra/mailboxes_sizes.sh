#!/bin/bash

#https://wiki.zimbra.com/wiki/Get_all_user%27s_mailbox_size_from_CLI
#https://wiki.zimbra.com/wiki/Zmmailbox


if [ "$(id -un)x" != "zimbrax" ]; then
  echo "Fatal error: This script needs to run as user zimbra."
  exit 1
fi


all_accounts=$(zmprov -l gaa)

get_mailboxes_sizes()
{

for account in $all_accounts
 do
#  mbox_size=$(zmmailbox -z -m $account gms)

#
#751.23 MB === user@mail.com
#s/\s//
#751.23MB === user@mail.com
#
  mbox_size=$(zmmailbox -z -m $account gms | sed 's/\s//')
  echo "$mbox_size === $account"
 done

}


get_mailboxes_sizes | sort -h -r

