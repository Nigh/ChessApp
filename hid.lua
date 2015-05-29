
module(..., package.seeall)

lib=require("hidusblib")


function check( vid, pid )
	return
end

function enum( vid, pid )
	return lib.enumerate( vid, pid )
end

function open( vid, pid )
	return lib.hid_open( vid, pid )
end

function set_wbuf( tab, length )
	return lib.set_writeBuf_from_table( tab, length )
end

function write( length )
	return lib.hid_write( length )
end

function read_timeout( length, timeout )
	return lib.hid_read_timeout( length, timeout )
end

function get_rbuf( length )
	return lib.get_readBuf( length )
end

