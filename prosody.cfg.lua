-- Prosody XMPP Server Configuration
--
-- Information on configuring Prosody can be found on our
-- website at http://prosody.im/doc/configure
--
-- Tip: You can check that the syntax of this file is correct
-- when you have finished by running: luac -p prosody.cfg.lua
-- If there are any errors, it will let you know what and where
-- they are, otherwise it will keep quiet.
--
-- Good luck, and happy Jabbering!


---------- Server-wide settings ----------
-- Settings in this section apply to the whole server and are the default settings
-- for any virtual hosts

-- This is a (by default, empty) list of accounts that are admins
-- for the server. Note that you must create the accounts separately
-- (see http://prosody.im/doc/creating_accounts for info)
-- Example: admins = { "user1@example.com", "user2@example.net" }
admins = { "leo@cryptotelefono.online" }

-- Enable use of libevent for better performance under high load
-- For more information see: http://prosody.im/doc/libevent
--use_libevent = true;

-- interfaces
interfaces = { "127.0.0.1", "46.101.175.246" }

-- This is the list of modules Prosody will load on startup.
-- It looks for mod_modulename.lua in the plugins folder, so make sure that exists too.
-- Documentation on modules can be found at: http://prosody.im/doc/modules
modules_enabled = {
	-- Generally required
		"roster"; -- Allow users to have a roster. Recommended ;)
		"saslauth"; -- Authentication for clients and servers. Recommended if you want to log in.
		"tls"; -- Add support for secure TLS on c2s/s2s connections
		"dialback"; -- s2s dialback support
		"disco"; -- Service discovery
		"posix"; -- POSIX functionality, sends server to background, enables syslog, etc.

	-- Not essential, but recommended
		"private"; -- Private XML storage (for room bookmarks, etc.)
		"vcard"; -- Allow users to set vCards

	-- These are commented by default as they have a performance impact
		"privacy"; -- Support privacy lists
		-- "compression"; -- Stream compression (requires the lua-zlib package installed)

	-- Nice to have
		"version"; -- Replies to server version requests
		"uptime"; -- Report how long server has been running
		"time"; -- Let others know the time here on this server
		"ping"; -- Replies to XMPP pings with pongs
		"pep"; -- Enables users to publish their mood, activity, playing music and more
		--"register"; -- Allow users to register on this server using a client and change passwords

	-- Admin interfaces
		--"admin_adhoc"; -- Allows administration via an XMPP client that supports ad-hoc commands
		--"admin_telnet"; -- Opens telnet console interface on localhost port 5582

	-- HTTP modules
		--"bosh"; -- Enable BOSH clients, aka "Jabber over HTTP"
		--"http_files"; -- Serve static files from a directory over HTTP

	-- Other specific functionality
		--"groups"; -- Shared roster support
		"announce"; -- Send announcement to all online users
		"welcome"; -- Welcome users who register accounts
		"watchregistrations"; -- Alert admins of registrations
		"motd"; -- Send a message to users when they log in
                "smacks";
                "csi";
                "throttle_presence";
                "filter_chatstates";
                "mam";
                "onions";
                "carbons";
		"blocking";
                "limit_auth";
                "default_bookmarks";
};

-- Disable account creation by default, for security
-- For more information see http://prosody.im/doc/creating_accounts
allow_registration = false;

-- Force clients to use encrypted connections? This option will
-- prevent clients from authenticating unless they are using encryption.

c2s_require_encryption = true;

-- Force certificate authentication for server-to-server connections?
-- This provides ideal security, but requires servers you communicate
-- with to support encryption AND present valid, trusted certificates.
-- NOTE: Your version of LuaSec must support certificate verification!
-- For more information see http://prosody.im/doc/s2s#security

s2s_secure_auth = false;

-- Many servers don\'t support encryption or have invalid or self-signed
-- certificates. You can list domains here that will not be required to
-- authenticate using certificates. They will be authenticated using DNS.

-- s2s_insecure_domains = {"xmpp.elbinario.net", "salas.xmpp.elbinario.net", }

-- Even if you leave s2s_secure_auth disabled, you can still require valid
-- certificates for some domains by specifying a list here.

--s2s_secure_domains = { "jabber.org" }

-- Required for init scripts and prosodyctl
pidfile = "/var/run/prosody/prosody.pid"

-- Select the authentication backend to use. The 'internal' providers
-- use Prosody\'s configured data storage to store the authentication data.
-- To allow Prosody to offer secure authentication mechanisms to clients, the
-- default provider stores passwords in plaintext. If you do not trust your
-- server please see http://prosody.im/doc/modules/mod_auth_internal_hashed
-- for information about using the hashed backend.

authentication = "internal_hashed"

-- Logging configuration
-- For advanced logging see http://prosody.im/doc/logging
log = {
	-- info = "/var/log/prosody/prosody.log"; -- Change 'info' to 'debug' for verbose logging
	error = "/var/log/prosody/prosody.err";
        -- debug = "/var/log/prosody/prosody.debug";
}

--ssl = {
	--dhparam = "/etc/nginx/ssl/dh-4096.pem";
       -- certificate = "/etc/prosody/certs/daemons.cf/daemons.cf.fullchain";
       -- key = "/etc/prosody/certs/cryptotelefono.online/privkey.pem";
       -- options = { "no_sslv2", "no_sslv3", "no_tlsv1", "no_ticket", "no_compression", "cipher_server_preference", "single_dh_use", "single_ecdh_use" }
--}

-- Tor
onions_tor_all = true
onions_only = false
onions_map = {
	["taolo.ga"] = "l3ybpw4vs6ie5rv2.onion";
	["jabber.calyxinstitute.org"] = "ijeeynrc6x2uy5ob.onion";
	["riseup.net"] = "4cjw6cwpeaeppfqz.onion";
	["jabber.otr.im"] = "5rgdtlawqkcplz75.onion";
	["jabber.systemli.org"] = "x5tno6mwkncu5m3h.onion";
	["securejabber.me"] = "giyvshdnojeivkom.onion";
	["so36.net"] = "s4fgy24e2b5weqdb.onion";
	["autistici.org"] = "wi7qkxyrdpu5cmvr.onion";
	["inventati.org"] = "wi7qkxyrdpu5cmvr.onion";
	["jabber.ipredator.se"] = "3iffdebkzzkpgipa.onion";
	["cloak.dk"] = "m2dsl4banuimpm6c.onion";
	["im.koderoot.net"] = "ihkw7qy3tok45dun.onion";
	["anonymitaet-im-inter.net"] = "rwf5skuv5vqzcdit.onion";
	["jabber.ccc.de"] = "okj7xc6j2szr2y75.onion";
}

-- MAM
archive_expires_after = "1w"

-- HTTP Upload
--https_ssl = {
  --     certificate = "/etc/prosody/certs/daemons.it/imagenes.daemons.it.fullchain";
    --   key = "/etc/prosody/certs/daemons.it/imagenes.daemons.it.privkey";
--}

--http_upload_file_size_limit = 4096
--http_external_url = "https://imagenes.daemons.it"
--Component "imagenes.daemons.it" "http_upload"

-- limit_auth
limit_auth_period = 30 -- over 30 seconds
limit_auth_max = 5 -- tolerate no more than 5 failed attempts

-- MUC
--Component "salas.daemons.cf" "muc"
  --  name = "Salas de Bad Daemons"
--Component "salas.daemons.it" "muc"
  --  name = "Salas de Bad Daemons"
--Component "salas.daemon4jidu2oig6.onion" "muc"
  --  name = "Salas de Bad Daemons"

-- Default MuC
--default_bookmarks = {
  --  { jid = "daemons@salas.daemons.it", name = "Bad Daemons" };
--};

-- Welcome
--welcome_message = "Bienvenida a este servidor, $user. Para que vea que no eres un bot, saluda en la sala daemons@salas.daemons.it. Solo tienes que hacerlo una vez y luego puedes borrar la sala. Si no lo haces, es posible que borre esta cuenta en un plazo de una semana. Saludos"

----------- Virtual hosts -----------
-- You need to add a VirtualHost entry for each domain you wish Prosody to serve.
-- Settings under each VirtualHost entry apply *only* to that host.

--VirtualHost "daemons.cf"

VirtualHost "amrmt5yiyeqb4iw7.onion"

VirtualHost "cryptotelefono.online"
ssl = {
	dhparam = "/etc/nginx/dh-4096.pem";
        certificate = "/etc/prosody/certs/cryptotelefono.online/fullchain.pem";
        key = "/etc/prosody/certs/cryptotelefono.online/privkey.pem";
        options = { "no_sslv2", "no_sslv3", "no_tlsv1", "no_ticket", "no_compression", "cipher_server_preference", "single_dh_use", "single_ecdh_use" }
}