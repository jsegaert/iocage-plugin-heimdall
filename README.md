# Heimdall Application Dashboard
This plugin provides a convenient way to install the [Heimdall Application Dashboard](https://github.com/linuxserver/Heimdall/blob/master/readme.md) in a FreeBSD jail using the [iocage](https://github.com/iocage/iocage) jail manager.

Heimdall is an elegant solution to organize all your web applications and links onto a single page website.

## To manually install this Plugin
Download the plugin manifest file to your local file system.
```
fetch https://raw.githubusercontent.com/jsegaert/iocage-my-plugins/master/heimdall.json 
```
Install the plugin.  Adjust the network settings as needed.
```
iocage fetch -P heimdall.json -n heimdall dhcp=on
```
## Plugin options
By default the interface listens on both ports 80 and 443.  To redirect HTTP requests to HTTPS, activate the HTTPSREDIRECT option as follows:
```
iocage set -P httpsredirect=true heimdall
```

