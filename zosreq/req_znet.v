module zosreq


// wg network reservation (znet)

pub struct ReqZnet {
pub mut:
	// name unique per deployment, re-used in request & response
	name string
	// unique nr for each network chosen, this identified private networks as connected to a container or vm or ...
	// corresponds to the 2nd number of a class B ipv4 address
	// is a class C of a chosen class B
	// form: e.g. 192.168.16.0/24
	// needs to be a private subnet
	subnet string
	// wireguard private key, curve25519
	// TODO: is this in libsodium
	wg_private_key string
	//>1024?
	wg_listen_port u16
	peers          []ReqPeerNetwork
}

// is a remote wireguard client which can connect to this node
pub struct ReqPeerNetwork {
pub mut:
	// is another class C in same class B as above
	subnet string
	// wireguard public key, curve25519
	wg_public_key string
	allowed_ips   []string
	// ipv4 or ipv6
	// can be empty, one of the 2 need to be filled in though
	endpoint string
}

// TODO: need API endpoint on ZOS to find open ports
// TODO: reservation for 1 h, after will be released again
