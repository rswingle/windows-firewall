##For this script to work, run it in the same directroy as a file named firewall.allow
## firewall.allow should be a plain-text list of addresses to allow network access to
## looking like the following without the pound signs:
## 127.0.0.1
## 10.0.0.0/8
## 192.168.0.0/16

set-netfirewallprofile  -All -DefaultInboundAction Block -DefaultOutboundAction Block

foreach ($ips in Get-Content .\firewall.allow){
    New-NetFirewallRule -DisplayName “Allow $ips out” -RemoteAddress $ips -Direction Outbound -Action allow
    New-NetFirewallRule -DisplayName “Allow $ips in” -RemoteAddress $ips -Direction Inbound -Action allow
}

