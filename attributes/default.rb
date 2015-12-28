id = :modern_nginx

default[id][:version] = '1.9.9'
default[id][:tarball_checksum] = 'de66bb2b11c82533aa5cb5ccc27cbce736ab87c9f2c761e5237cda0b00068d73'

default[id][:with_http2] = true
default[id][:with_ipv6] = true
default[id][:with_dhparam] = true

default[id][:openssl][:version] = '1.0.2e'
default[id][:openssl][:tarball_checksum] = 'e23ccafdb75cfcde782da0151731aa2185195ac745eea3846133f2e05c0e0bff'
