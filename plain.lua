
lib=require("hidusblib")
lib.enumerate(0x1130,0x3132)
lib.hid_open(0x1130,0x3132)
tab = { 0x00, 0x55, 0x53, 0x42, 0x43, 0xff, 0xff, 0xff, 0xf2 }
lib.set_writeBuf_from_table(tab,9)
lib.hid_write(10);
res=lib.hid_read_timeout(65,1000)
idx=0
while 1 do
	res=lib.hid_read_timeout(41,50)
	if(res>0)then
		tab = lib.get_readBuf(40)
		for k,v in ipairs(tab) do
			print(k..":"..v)
		end
		-- break
	else
		lib.hid_write(9);
	end
	idx=idx+1
	if(idx>50)then
		break
	end
	print(idx)
end

-- path,vendor_id,product_id,serial_number,release_number,manufacturer_string,product_string,usage_page,usage,interface_number=lib.get_enum(0)

-- print(lib.get_enum(0))
