-------------------------------------------------------------------------------
-- Xavante configuration file.
--
-- The configuration defines the Xavante environment
-- Commented fields are optional and assume default values
--
-- Xavante defines virtualhosts for each site running with Xavante.
-- Each virtualhost can define the handlers for specific files extensions.
-- Xavante currently offers a fileHandler and a CGILuaHandler.
--
-- Xavante configuration can be redefined on the default file structure by the
-- optional /conf/xavante/config.lua file. If it does not exist, Xavante loads
-- the default /bin/xavante/config.lua file.
--
-- Author: Andre Carregal and Javier Guerra
-- Copyright (c) 2004-2005 Kepler Project
-------------------------------------------------------------------------------
require "xavante.filehandler"
require "xavante.cgiluahandler"

local webdir = xavante.webdir()
local file = xavante.filehandler
local xcgi = xavante.cgiluahandler.makeHandler (webdir)

xavante.register{
  server = {host = "*", port = 80},
  virtualhosts = {
    localhost = {
        defaultPages = {"index.html", "index.lp", "index.lua"}, -- not used yet
        rules = {
            {match = "/", with = file, params = {baseDir = webdir}},
            {match = {"/*.lp", "/*.lua"},  with = xcgi},
        },
    }, -- localhost
  }, -- virtualhosts
}