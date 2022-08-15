GM = GM or GAMEMODE

-- If you want to.
function GM:SetupDatabase()
	-- Which method of storage: sqlite, tmysql4, mysqloo
	nut.db.module = "sqlite"
	-- The hostname for the MySQL server.
	nut.db.hostname = "nshalorp.site.nfoservers.com"
	-- The username to login to the database.
	nut.db.username = "nshalorp"
	-- The password that is associated with the username.
	nut.db.password = "Jdfyr4fuZV"
	-- The database that the user should login to.
	nut.db.database = "nutscript"
	-- The port for the database, you shouldn't need to change this.
	nut.db.port = 3306
end