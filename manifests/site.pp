node puppet.agent.local {
	include mysql
	include php
	include nginx
	include user
}