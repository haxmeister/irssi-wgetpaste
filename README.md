# irssi-wgetpaste
A plugin for irssi that allows you to paste files using wgetpaste and post the result

### Installation:

place the ```paster.pl``` file in ```~/.irssi/scripts```

to load the script for use, from irssi issue the command:

```/script load paster.pl```

### Usage:

Once the script is loaded, you can issue commands using

```/paste <path-to-file>```

### Example:

A simple example:

```/paste /etc/portage/package.use```

### Errors:

The plugin will

1. Check to see if wgetpaste exist at /usr/bin/wgetpaste and warn if it does not
2. Check to see if the user issued a <path-to-file> that actually exists and warn if it does not
3. Check to see that the file is not empty and warn if it does not


