# OpenVPN:

## Killswitch
### OpenVPN:

Please, open terminal and run these commands one by one:
#### block outgoing connections by default:
iptables -P OUTPUT DROP

#### And then allow traffic to dns and openvpn servers
iptables -A OUTPUT -p udp -m multiport --dport 53,1194 -j ACCEPT
iptables -A OUTPUT -p tcp -m multiport --dport 53,443 -j ACCEPT

#### Allow outgoing connections on vpn interface
iptables -A OUTPUT -o tun+ -j ACCEPT

These rules will disable all traffic which would be sent not through OpenVPN tun interface.

### WireGuard:

We haven't tested it on our end, so we can't guarantee if it will work as expected, but the same setup should work. Some caveats to have in mind in terms of WireGuard is that it's UDP-only and uses slightly different ports, namely the one you should try is 51820 instead of the values mentioned above.
